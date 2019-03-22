#!/sbin/sh
#
# Backup and restore addon /system files
#

export C=/tmp/backupdir
export S=/system
export V=9

export ADDOND_VERSION=1

DEBUG=0

# Preserve /system/addon.d in /tmp/addon.d
preserve_addon_d() {
  rm -rf /tmp/addon.d/
  mkdir -p /tmp/addon.d/
  cp -a /system/addon.d/* /tmp/addon.d/
    # Discard any scripts that aren't at least our version level
    for f in /postinstall/tmp/addon.d/*sh; do
      SCRIPT_VERSION=$(grep "^# ADDOND_VERSION=" $f | cut -d= -f2)
      if [ -z "$SCRIPT_VERSION" ]; then
        SCRIPT_VERSION=1
      fi
      if [ $SCRIPT_VERSION -lt $ADDOND_VERSION ]; then
        rm $f
      fi
    done
  chmod 755 /tmp/addon.d/*.sh
}

# Restore /system/addon.d in /tmp/addon.d
restore_addon_d() {
  cp -a /tmp/addon.d/* /system/addon.d/
  rm -rf /tmp/addon.d/
}

# Restore only if backup has the expected major and minor version
check_prereq() {
  if [ ! -f /tmp/build.prop ]; then
    # this will block any backups made before 8 cause file was not copied before
    echo "Not restoring files from incompatible version: $V"
    exit 127
  fi
  if ( ! grep -q "^ro.build.version.release=$V.*" /tmp/build.prop ); then
    echo "Not restoring files from incompatible version: $V"
    exit 127
  fi
}

check_blacklist() {
  if [ -f /system/addon.d/blacklist ];then
    ## Discard any known bad backup scripts
    cd /$1/addon.d/
    for f in *sh; do
      s=$(md5sum $f | awk {'print $1'})
      grep -q $s /system/addon.d/blacklist && rm -f $f
    done
  fi
}

# Execute /system/addon.d/*.sh scripts with $1 parameter
run_stage() {
  for script in $(find /tmp/addon.d/ -name '*.sh' |sort -n); do
    if [ $DEBUG -eq 1 ]; then
        echo run_stage $script $1
    fi
    $script $1
  done
}

case "$1" in
  backup)
    # make sure we dont start with any leftovers
    rm -rf $C
    cp /system/bin/backuptool.functions /tmp
    cp /system/build.prop /tmp
    mkdir -p $C
    #check_prereq
    check_blacklist system
    preserve_addon_d
    run_stage pre-backup
    run_stage backup
    run_stage post-backup
  ;;
  restore)
    cp /system/bin/backuptool.functions /tmp
    check_prereq
    check_blacklist tmp
    run_stage pre-restore
    run_stage restore
    run_stage post-restore
    restore_addon_d
    rm -rf $C
    sync
  ;;
  *)
    echo "Usage: $0 {backup|restore}"
    exit 1
esac

exit 0
