#!/bin/sh

export PATH=/bin:$BIN:$PATH
set -e

usage() {
  cat <<EOM
  Usage: $(basename $0) <Path to output directory, typically \$OUT variable>
EOM
  exit 1
}

[ $# -ne 1 ] && usage
# set path to output directory, typical $OUT variable
OUT="$1"

if [ ! -d "$OUT" ];then
  echo "specified OUT-directory: $OUT does not exist!"
  exit 1
fi

# Store the main manifest and changelog in $OUT.
# Copy the main manifest to the target system/etc.
manifest="$OUT/manifest.xml"
changelog="$OUT/Changelog.txt"
system_changelog="$OUT/system/etc/Changelog.txt"

repo manifest -r > "$manifest.tmp"
if [ -f "$manifest" -a ! "$manifest" -nt "$changelog" ]; then
  diff=0
  cmp "$manifest" "$manifest.tmp" >/dev/null 2>&1 || diff=1
  if [ $diff -eq 0 ]; then
    # The changelog is up to date.
    # Cleanup and copy it over to system.
    echo ${buildppl}"Changelog up to date"${txtrst}
    rm -f "$manifest.tmp"
    mkdir -p $(dirname "$system_changelog")
    cp "$changelog" "$system_changelog"
    exit 0
  fi
fi

# Print something to build output
echo ${bldppl}"Generating changelog..."${txtrst}

# Delete the existing manifest so that if we fail, the next build
# will not think it is up to date.
rm -f "$manifest"

rm -f "$changelog"
touch "$changelog"
for i in $(seq 1 10);
do
  after_date=`date --date="$i days ago" +%m-%d-%Y`
  k=$((i - 1))
  until_date=`date --date="$k days ago" +%m-%d-%Y`

  # Line with after --- until was too long for a small ListView
  echo "====================" >> "$changelog"
  echo "     $until_date"     >> "$changelog"
  echo "====================" >> "$changelog"
  echo >> "$changelog"

  # Cycle through every repo to find commits between 2 dates
  current_path="$(realpath `pwd`)"

  repo forall -c "GIT_LOG=\`git log --oneline --after=$after_date --until=$until_date\` ; if [ ! -z \"\$GIT_LOG\" ]; then printf  '\n   * '; realpath \`pwd\` | sed 's|^$current_path/||' ; echo \"\$GIT_LOG\"; fi" >> "$changelog"
  echo >> "$changelog"
done

sed -i 's/^project/   */g' "$changelog"

# Now that we have successfully generated the changelog, move the
# manifest into position and copy the changelog to the target.
mv "$manifest.tmp" "$manifest"
mkdir -p $(dirname "$system_changelog")
cp "$changelog" "$system_changelog"

exit 0
