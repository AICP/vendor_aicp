#!/usr/bin/env python3

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
]

def write_header(f, sources):
    f.write("# This hosts file has been generated on:\n# {}\n# This file is generated from the following sources:\n".format(datetime.now().strftime("%Y-%m-%d %H:%M:%S")))
    for s in sources:
        f.write("# {}\n".format(s))
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
    source_dir = sys.argv[1]
    outfile = sys.argv[2]
    sources = sys.argv[3:]
    redirects = []
    source_urls = []
    with open("{}/sources.txt".format(source_dir), "r") as fin:
        for line in fin:
            line = line.split("\n")[0]
            if len(line) > 0:
                source_urls.append(line)
    with open(outfile, 'w') as fout:
        write_header(fout, source_urls)
        # Read hosts sources
        for infile in sources:
            with open(infile, 'r') as fin:
                for line in fin:
                    line = line.split('\n')[0]
                    redirect = read_redirect(line)
                    if redirect != None:
                        redirects.append(redirect)
        # Remove duplicates and sort it
        redirects = sorted(list(set(redirects)))
        # Write it
        for redirect in redirects:
            if redirect[1] in BLACKLIST:
                continue
            if redirect[0] != "127.0.0.1" and redirect[0] != "0.0.0.0":
                continue
            fout.write("127.0.0.1 {}\n".format(redirect[1]))
