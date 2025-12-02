#!/usr/bin/env python
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2012-2017 AICP Project
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
import filecmp
import json
import netrc
import os
import re
import sys
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

from xml.etree import ElementTree

device_path = sys.argv[1]

if device_path.endswith("/"):
    device_path = device_path[:-1]

try:
    device = device_path[device_path.rfind("/") + 1:]
except:
    device = device_path

repositories = []

page = 1

local_manifests = r'.repo/local_manifests'
if not os.path.exists(local_manifests): os.makedirs(local_manifests)

removal_manifest = ".repo/local_manifests/00_aicp_removals.xml"
tmp_removal_manifest = ".repo/local_manifests/tmp_aicp_removals.xml"

def exists_in_tree(lm, repository):
    for child in lm.getchildren():
        if child.attrib['name'].endswith(repository):
            return child
    return None

# in-place prettyprint formatter
def indent(elem, level=0):
    i = "\n" + level*"  "
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

def is_in_manifest(projectname):
    try:
        lm = ElementTree.parse(tmp_removal_manifest)
        lm = lm.getroot()
    except:
        lm = ElementTree.Element("manifest")

    for localpath in lm.findall("remove-project"):
        if localpath.get("name") == projectname:
            return 1

    return None

def add_to_manifest_dependencies(repositories):
    try:
        lm = ElementTree.parse(tmp_removal_manifest)
        lm = lm.getroot()
    except:
        lm = ElementTree.Element("manifest")

    for repository in repositories:
        repo_name = repository['repository']
        existing_project = exists_in_tree(lm, repo_name)
        if existing_project != None:
            print('Remove-project for AICP/%s already exists' % (repo_name))
            continue

        print ('Adding remove-project to manifest: %s' % (repo_name))
        project = ElementTree.Element("remove-project", attrib = { "name": repo_name })

        lm.append(project)

    indent(lm, 0)
    raw_xml = ElementTree.tostring(lm).decode()
    raw_xml = '<?xml version="1.0" encoding="UTF-8"?>\n' + raw_xml

    f = open(tmp_removal_manifest, 'w')
    f.write(raw_xml)
    f.close()

def add_to_manifest(repositories):
    try:
        lm = ElementTree.parse(tmp_removal_manifest)
        lm = lm.getroot()
    except:
        lm = ElementTree.Element("manifest")

    for repository in repositories:
        repo_name = repository['repository']
        if exists_in_tree(lm, repo_name):
            print('Remove-project for AICP/%s already exists' % (repo_name))
            continue

        print ('Adding remove-project to manifest: %s' % (repo_name))
        project = ElementTree.Element("remove-project", attrib = { "name": "AICP/%s" % (repo_name) })

        lm.append(project)

    indent(lm, 0)
    raw_xml = ElementTree.tostring(lm).decode()
    raw_xml = '<?xml version="1.0" encoding="UTF-8"?>\n' + raw_xml

    f = open(tmp_removal_manifest, 'w')
    f.write(raw_xml)
    f.close()

def fetch_dependencies(repo_path):
    #print('Looking for required remove-projects')
    dependencies_path = repo_path + '/aicp.removal.dependencies'
    syncable_repos = []

    if os.path.exists(dependencies_path):
        dependencies_file = open(dependencies_path, 'r')
        dependencies = json.loads(dependencies_file.read())
        fetch_list = []

        for dependency in dependencies:
            if not is_in_manifest("%s" % dependency['repository']):
                fetch_list.append(dependency)

        dependencies_file.close()

        if len(fetch_list) > 0:
            add_to_manifest_dependencies(fetch_list)

    if len(syncable_repos) > 0:
        print('Syncing dependencies')
        os.system('repo sync --force-sync %s' % ' '.join(syncable_repos))

def remove_removals(removal_manifest):
    tmp_manifest_disable = ".repo/local_manifests/aicp_manifest.xml"
    tmp_manifest_disabled = ".repo/local_manifests/tmp_disabled"
    syncable_repos = []
    try:
        lm = ElementTree.parse(removal_manifest)
        lm = lm.getroot()
    except:
        lm = ElementTree.Element("manifest")
    for child in lm.getchildren():
        syncable_repos.append(child.attrib['name'])
    os.system('rm %s' % removal_manifest)

    if os.path.exists(tmp_manifest_disable):
        os.system('mv %s %s' % (tmp_manifest_disable, tmp_manifest_disabled))
    for remove_dep in syncable_repos:
        remove_dependency(os.popen('repo list -p %s' % remove_dep).read()[:-1], tmp_manifest_disabled)
    if os.path.exists(tmp_manifest_disabled):
        os.system('mv %s %s' % (tmp_manifest_disabled, tmp_manifest_disable))

    os.system('repo sync --force-sync %s' % ' '.join(syncable_repos))

def remove_dependency(dependency_paths, manifest_path):
    try:
        lm = ElementTree.parse(manifest_path)
        lm = lm.getroot()
    except:
        lm = ElementTree.Element("manifest")
    for child in lm.getchildren():
        for dependency_path in dependency_paths.split('\n'):
            if child.attrib['path'] == dependency_path:
                print('Removing dependency %s from local manifest to avoid conflicts' % child.attrib['path'])
                lm.remove(child)
    f = open(manifest_path, 'w')
    f.write(ElementTree.tostring(lm).decode())
    f.close()

fetch_dependencies(device_path)

if os.path.exists(removal_manifest):
    if os.path.exists(tmp_removal_manifest):
        if filecmp.cmp(removal_manifest, tmp_removal_manifest):
            print('Leaving repo removals in local manifest unchanged')
            os.system('rm %s' % tmp_removal_manifest)
        else:
            print('Updating repo removals in local manifest')
            remove_removals(removal_manifest)
            os.system('mv %s %s' % (tmp_removal_manifest, removal_manifest))
    else:
        print('Removing previous repo removals from local manifest')
        remove_removals(removal_manifest)
elif os.path.exists(tmp_removal_manifest):
    print('Created repo removals for local manifest')
    os.system('mv %s %s' % (tmp_removal_manifest, removal_manifest))
else:
    print('No remove-project used or required')
