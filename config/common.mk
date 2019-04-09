PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bin/clean_cache.sh:system/bin/clean_cache.sh

# Backup Tool
ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/aicp/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/aicp/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh \
    vendor/aicp/prebuilt/addon.d/69-gapps.sh:system/addon.d/69-gapps.sh
else
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aicp/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aicp/prebuilt/bin/50-aicp.sh:system/addon.d/50-aicp.sh \
    vendor/aicp/prebuilt/bin/blacklist:system/addon.d/blacklist
endif

# Backup services whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# AICP-specific init file
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init.local.rc:root/init.aicp.rc

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/aicp/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/lineage-hiddenapi-package-whitelist.xml:system/etc/permissions/lineage-hiddenapi-package-whitelist.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/aicp-power-whitelist.xml:system/etc/sysconfig/aicp-power-whitelist.xml

# Omnijaws
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/permissions/privapp-permissions-omnijaws.xml:system/etc/permissions/privapp-permissions-omnijaws.xml

# AICP-specific startup services
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/aicp/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/aicp/prebuilt/common/bin/sysinit:system/bin/sysinit

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
    LockClock \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    PhaseBeam

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# JamesDSP
PRODUCT_PACKAGES += \
   libjamesdsp

# DSPManager
PRODUCT_PACKAGES += \
    DSPManager

# Phonograph
PRODUCT_PACKAGES += \
    Phonograph

# Jelly
PRODUCT_PACKAGES += \
    Jelly

# OmniJaws
PRODUCT_PACKAGES += \
    OmniJaws

# Fonts packages
PRODUCT_PACKAGES += \
    invictrix-fonts

# Extra Optional packages
PRODUCT_PACKAGES += \
    Calculator \
    LatinIME \
    BluetoothExt \
    Launcher3Dark

# AICP packages
PRODUCT_PACKAGES += \
    AicpExtras \
    TilesWallpaper

include packages/overlays/AICP/product_packages.mk

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

PRODUCT_PACKAGES += \
    charger_res_images

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PACKAGES += \
    vim

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# Disable rescue party
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.disable_rescue=true

# codeaurora telephony-ext
PRODUCT_PACKAGES += \
   telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGES += \
    AndroidDarkThemeOverlay \
    SettingsDarkThemeOverlay

PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/common

# Boot animation include
PRODUCT_PACKAGES += \
    bootanimation.zip

# Versioning System
# AICP first version.
include vendor/aicp/config/aicp_version.mk

# AICP OTA
ifneq ($(AICP_BUILDTYPE),UNOFFICIAL)
PRODUCT_PACKAGES +=  \
   AICP_OTA_Updater
endif

# Google sounds
include vendor/aicp/google/GoogleAudio.mk

EXTENDED_POST_PROCESS_PROPS := vendor/aicp/tools/aicp_process_props.py
