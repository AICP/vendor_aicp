#!/usr/bin/env python
# Copyright (C) 2012-2013, The CyanogenMod Project
#           (C) 2017,      The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from __future__ import print_function

import base64
import json
import netrc
import os
import sys

from xml.etree import ElementTree

try:
    # For python3
    import urllib.error
    import urllib.parse
    import urllib.request
except ImportError:
    # For python2
    import imp
    import urllib2
    import urlparse
    urllib = imp.new_module('urllib')
    urllib.error = urllib2
    urllib.parse = urlparse
    urllib.request = urllib2

DEBUG = False

custom_local_manifest = ".repo/local_manifests/roomservice.xml"
custom_default_revision =  os.getenv('ROOMSERVICE_DEFAULT_BRANCH', 'u14.0')
custom_dependencies = "aicp.dependencies"
org_manifest = "aicp"  # leave empty if org is provided in manifest
org_display = "AICP"  # needed for displaying

github_auth = None


local_manifests = '.repo/local_manifests'
if not os.path.exists(local_manifests):
    os.makedirs(local_manifests)


def debug(*args, **kwargs):
    if DEBUG:
        print(*args, **kwargs)


def add_auth(g_req):
    global github_auth
    if github_auth is None:
        try:
            auth = netrc.netrc().authenticators("api.github.com")
        except (netrc.NetrcParseError, IOError):
            auth = None
        if auth:
            github_auth = base64.b64encode(
                ('%s:%s' % (auth[0], auth[2])).encode()
            )
        else:
            github_auth = ""
    if github_auth:
        g_req.add_header("Authorization", "Basic %s" % github_auth)


def indent(elem, level=0):
    # in-place prettyprint formatter
    i = "\n" + "  " * level
    if len(elem):
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
        for elem in elem:
            indent(elem, level+1)
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
    else:
        if level and (not elem.tail or not elem.tail.strip()):
            elem.tail = i

def load_manifest(manifest):
    try:
        man = ElementTree.parse(manifest).getroot()
    except (IOError, ElementTree.ParseError):
        man = ElementTree.Element("manifest")
    return man

def get_from_manifest(device_name):
    if os.path.exists(custom_local_manifest):
        man = load_manifest(custom_local_manifest)
        for local_path in man.findall("project"):
            lp = local_path.get("path").strip('/')
            if lp.startswith("device/") and lp.endswith("/" + device_name):
                return lp
    return None


def is_in_manifest(project_path):
    man = load_manifest(custom_local_manifest)
    for local_path in man.findall("project"):
        if local_path.get("path") == project_path:
            return True
    return False


def add_to_manifest(repos, fallback_branch=None):
    lm = load_manifest(custom_local_manifest)

    for repo in repos:
        repo_name = repo['repository']
        repo_path = repo['target_path']
        if 'branch' in repo:
            repo_branch=repo['branch']
        else:
            repo_branch=custom_default_revision
        if 'remote' in repo:
            repo_remote=repo['remote']
        elif "/" not in repo_name:
            repo_remote=org_manifest
        elif "/" in repo_name:
            repo_remote="aicp"

        if is_in_manifest(repo_path):
            print('already exists: %s' % repo_path)
            continue

        print('Adding dependency:\nRepository: %s\nBranch: %s\nRemote: %s\nPath: %s\n' % (repo_name, repo_branch,repo_remote, repo_path))

        project = ElementTree.Element(
            "project",
            attrib={"path": repo_path,
                    "remote": repo_remote,
                   "name": "%s" % repo_name}
        )

        clone_depth = os.getenv('ROOMSERVICE_CLONE_DEPTH')
        if clone_depth:
            project.set('clone-depth', clone_depth)

        if repo_branch is not None:
            project.set('revision', repo_branch)
        elif fallback_branch:
            print("Using branch %s for %s" %
                  (fallback_branch, repo_name))
            project.set('revision', fallback_branch)
        else:
            print("Using default branch for %s" % repo_name)
        if 'clone-depth' in repo:
            print("Setting clone-depth to %s for %s" % (repo['clone-depth'], repo_name))
            project.set('clone-depth', repo['clone-depth'])
        lm.append(project)

    indent(lm)
    raw_xml = "\n".join(('<?xml version="1.0" encoding="UTF-8"?>',
                         ElementTree.tostring(lm).decode()))

    f = open(custom_local_manifest, 'w')
    f.write(raw_xml)
    f.close()

_fetch_dep_cache = []


def fetch_dependencies(repo_path, fallback_branch=None, first_dependency=False):
    global _fetch_dep_cache
    if repo_path in _fetch_dep_cache:
        return
    _fetch_dep_cache.append(repo_path)

    print('Looking for dependencies')

    if first_dependency:
        os.system('vendor/aicp/build/tools/roomcleaner.py %s' % repo_path)

    dep_p = '/'.join((repo_path, custom_dependencies))
    if os.path.exists(dep_p):
        with open(dep_p) as dep_f:
            dependencies = json.load(dep_f)
    else:
        dependencies = {}
        print('%s has no additional dependencies.' % repo_path)

    fetch_list = []
    syncable_repos = []

    for dependency in dependencies:
        if not is_in_manifest(dependency['target_path']):
            if not dependency.get('branch'):
                dependency['branch'] = custom_default_revision

            fetch_list.append(dependency)
            syncable_repos.append(dependency['target_path'])
        else:
            print("Dependency already present in manifest: %s => %s" % (dependency['repository'], dependency['target_path']))

    if fetch_list:
        print('Adding dependencies to manifest\n')
        add_to_manifest(fetch_list, fallback_branch)

    if syncable_repos:
        print('Syncing dependencies')
        os.system('repo sync --force-sync --no-tags --current-branch --no-clone-bundle %s' % ' '.join(syncable_repos))

    for deprepo in syncable_repos:
        fetch_dependencies(deprepo)


def has_branch(branches, revision):
    return revision in (branch['name'] for branch in branches)


def detect_revision(repo):
    """
    returns None if using the default revision, else return
    the branch name if using a different revision
    """
    print("Checking branch info")
    githubreq = urllib.request.Request(
        repo['branches_url'].replace('{/branch}', ''))
    add_auth(githubreq)
    result = json.loads(urllib.request.urlopen(githubreq).read().decode())

    print("Calculated revision: %s" % custom_default_revision)

    if has_branch(result, custom_default_revision):
        return custom_default_revision

    print("Branch %s not found" % custom_default_revision)
    sys.exit()


def main():
    global DEBUG
    try:
        depsonly = bool(sys.argv[2] in ['true', 1])
    except IndexError:
        depsonly = False

    if os.getenv('ROOMSERVICE_DEBUG'):
        DEBUG = True

    product = sys.argv[1]
    device = product[product.find("_") + 1:] or product

    if depsonly:
        repo_path = get_from_manifest(device)
        if repo_path:
            fetch_dependencies(repo_path, None, True)
        else:
            # Try again without removing underscores
            device = product
            repo_path = get_from_manifest(device)
            if repo_path:
                fetch_dependencies(repo_path)
            else:
                print("Trying dependencies-only mode on a "
                      "non-existing device tree?")
        sys.exit()

    print("Device {0} not found. Attempting to retrieve device repository from "
          "{1} Github (https://github.com/{1}).".format(device, org_display))

    githubreq = urllib.request.Request(
        "https://api.github.com/search/repositories?"
        "q={0}+user:{1}+in:name+fork:true".format(device, org_display))
    add_auth(githubreq)

    repositories = []

    try:
        result = json.loads(urllib.request.urlopen(githubreq).read().decode())
    except urllib.error.URLError:
        print("Failed to search GitHub")
        sys.exit()
    except ValueError:
        print("Failed to parse return data from GitHub")
        sys.exit()
    for res in result.get('items', []):
        repositories.append(res)

    for repository in repositories:
        repo_name = repository['name']

        if not (repo_name.startswith("device_") and
                repo_name.endswith("_" + device)):
            continue
        print("Found repository: %s" % repository['name'])

        fallback_branch = detect_revision(repository)
        manufacturer = repo_name[7:-(len(device)+1)]
        repo_path = "device/%s/%s" % (manufacturer, device)
        adding = [{'repository': "AICP/%s" % repo_name, 'target_path': repo_path}]

        add_to_manifest(adding, fallback_branch)

        print("Syncing repository to retrieve project.")
        os.system('repo sync --force-sync --no-tags --current-branch --no-clone-bundle %s' % repo_path)
        print("Repository synced!")

        fetch_dependencies(repo_path, fallback_branch, True)
        print("Done")
        sys.exit()

    print("Repository for %s not found in the %s Github repository list."
          % (device, org_display))
    print("If this is in error, you may need to manually add it to your "
          "%s" % custom_local_manifest)

if __name__ == "__main__":
    main()
