#!/bin/bash -e
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

echo "- Generating vendor/lineage/prebuilt/generated/build-manifest.xml"
if [ "$MANIFEST_EXCLUDES" ]; then MANIFEST_EXCLUDES="|${MANIFEST_EXCLUDES}"; fi
python3 .repo/repo/repo manifest -o - -r | grep -Ev "proprietary_${MANIFEST_EXCLUDES}" > vendor/lineage/prebuilt/generated/build-manifest.xml
