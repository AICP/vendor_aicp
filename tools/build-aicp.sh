#!/bin/bash

## Setup Variables Here 

CPUS=$(grep "^processor" /proc/cpuinfo | wc -l)      # How many cpu do we have
date=$(date +%Y%m%d-%H%M)			     # Can you tell me the time & date
startt=$(date +%s)				     # start time
DATE=date
### colors ##

 . vendor/aicp/tools/colors

############### DO NOT CHANGE #################

usage()
{
	echo -e ""
	echo -e $CL_BOL"Usage:"$CL_RST
	echo -e "  build.sh [options] device"
	echo -e ""
	echo -e $CL_BOL"  Options:"$CL_RST
	echo -e "    -c  Clean before build"
	echo -e "    -d  Use debugging file build.log"
	echo -e "    -j# Set jobs"
	echo -e ""
	echo -e $CL_BOL"  Example:"$CL_RST
	echo -e "    ./build.sh -c m7tmo"
	echo -e ""
	exit 1
}


# Make sure we are in an Android Build 

if [ ! -d ".repo" ]; then
          echo -e $CL_RED"No .repo directory found."$CL_RST
          exit 1
fi

# Let's build the options for the Menu
opt_clean=0
opt_deb=0
opt_jobs="$CPUS"
opt_sync=0

while getopts "cdjL:s" opt; do
	case "$opt" in
	c) opt_clean=1 ;;
	d) opt_deb=1 ;;
	j) opt_jobs="$OPTARG" ;;
        L) opt_log=1 ;;
	s) opt_sync=1 ;;
	*) usage
	esac
done
shift $((OPTIND-1))
if [ "$#" -ne 1 ]; then
	usage
fi
device="$1"

# get time of startup
t1=$($DATE +%s)

echo -e $CL_CYA"Building $CL_GRN A $CL_YLW I $CLA_BLU C $CL_MAG P"$CL_RST


if [ "$opt_clean" -ne 0 ]; then
	make clean >/dev/null
fi


rm -f out/target/product/$device/obj/KERNEL_OBJ/.version

if [ "$opt_deb" -ne 0 ]; then
       exec > >(tee build.log ) 
fi

# setup environment
echo -e $CL_BLU"Setting up environment"$CL_RST
. build/envsetup.sh

# Remove system folder (this will create a new build.prop with updated build time and date)
rm -rf out/target/product/$device/system/

# lunch device
echo -e ""
echo -e $CL_BLU"Lunching device,"
lunch "aicp_$device-userdebug" 

echo -e ""
echo -e $CL_BLU"Starting compilation;"$CL_RST

make -j"$opt_jobs" bacon  
echo -e ""


# Find the ROM 

ZIP=`find ${ANDROID_PRODUCT_OUT}/ . -maxdepth 1 -name '*.zip' -mtime -1 | xargs stat --format '%n' | sort -nr | cut -d: -f2- | head -1`
    if [ ! -f "$ZIP" ]; then
      echo "Error: no output .zip found on ${ANDROID_PRODUCT_OUT}" 
      exit 1
    fi

# finished? get elapsed time
t2=$($DATE +%s)

tmin=$(( (t2-t1)/60 ))
tsec=$(( (t2-t1)%60 ))

echo -e $CL_GRN"Total time elapsed:$CL_RST $CL_GRN$tmin minutes $tsec seconds"$CL_RST



