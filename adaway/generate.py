#!/usr/bin/env python3

from os.path import dirname
from subprocess import check_output, CalledProcessError
from datetime import datetime
import sys

# Don't add these from adaway sources, but handle manually if needed
BLACKLIST = [
    "localhost",
    "localhost.localdomain",
    "local",
    "broadcasthost",
    "ip6-localhost",
    "ip6-loopback",
    "ip6-localnet",
    "ip6-mcastprefix",
    "ip6-allnodes",
    "ip6-allrouters",
    "ip6-allhosts",
    "0.0.0.0",
    "ad.doubleclick.net",
    "www.googleadservices.com",
]

def get_revision_string(directory):
    try:
        repo_url = check_output(
                ["git", "config", "--get", "remote.github.url"], cwd=directory, universal_newlines=True)
        head_id = check_output(
                ["git", "rev-parse", "HEAD"], cwd=directory, universal_newlines=True)
        return f"# {repo_url}# {head_id}"
    # If the file is not in a git repo
    except CalledProcessError:
        return f"# File at {directory} not versioned\n"

def write_header(f, source_revision):
    f.write("# This hosts file has been generated on:\n# {}\n# This file is generated from the following sources:\n".format(datetime.now().strftime("%Y-%m-%d %H:%M:%S")))
    f.write("{}\n".format(source_revision))
    f.write("\n127.0.0.1 localhost\n::1 localhost\n\n")

def read_redirect(line):
    source = None
    target = None
    for l in line.split(" "):
        if l.startswith("#"):
            # Ignore comments
            return None
        if len(l) > 0:
            if source == None:
                source = l
            else:
                target = l
                return (source, target)
    return None

if __name__ == "__main__":
    source_revision = ""
    outfile = sys.argv[1]
    sources = sys.argv[2:]
    redirects = []
    with open(outfile, 'w') as fout:
        # Read hosts sources
        for infile in sources:
            with open(infile, 'r') as fin:
                for line in fin:
                    line = line.split('\n')[0]
                    redirect = read_redirect(line)
                    if redirect != None:
                        redirects.append(redirect)
            source_revision += get_revision_string(dirname(infile))
        write_header(fout, source_revision)
        # Remove duplicates and sort it
        redirects = sorted(list(set(redirects)))
        # Write it
        for redirect in redirects:
            if redirect[1] in BLACKLIST:
                continue
            if redirect[0] != "127.0.0.1" and redirect[0] != "0.0.0.0":
                continue
            fout.write("127.0.0.1 {}\n".format(redirect[1]))
