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

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aicp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aicp/prebuilt/common/bin/50-aicp.sh:system/addon.d/50-aicp.sh \
    vendor/aicp/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/aicp/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/aicp/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
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

# Copy LatinIME for gesture typing
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

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

# Fix Dialer
#PRODUCT_COPY_FILES +=  \
#    vendor/aicp/prebuilt/common/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# AICP-specific startup services
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/aicp/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/aicp/prebuilt/common/bin/sysinit:system/bin/sysinit

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
    LockClock \
    su

# Turbo
PRODUCT_PACKAGES += \
    Turbo \
    turbo.xml \
    privapp-permissions-turbo.xml

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    PhaseBeam

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# AudioFX
PRODUCT_PACKAGES += \
    AudioFX

# Extra Optional packages
PRODUCT_PACKAGES += \
    Calculator \
    LatinIME \
    BluetoothExt \
    Launcher3Dark

# AICP packages
PRODUCT_PACKAGES += \
    AicpExtras


# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g


PRODUCT_PACKAGES += \
    charger_res_images

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# Disable rescue party
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.disable_rescue=true

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
PRODUCT_VERSION_MAJOR = 14
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0
AICP_POSTFIX := -$(shell date +"%Y%m%d-%H%M")
ifdef AICP_BUILD_EXTRA
    AICP_POSTFIX := -$(AICP_BUILD_EXTRA)
endif

ifndef AICP_BUILDTYPE
    AICP_BUILDTYPE := UNOFFICIAL
endif

# Set all versions
AICP_VERSION :=AICP-$(AICP_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(AICP_BUILDTYPE)$(AICP_POSTFIX)
AICP_MOD_VERSION := AICP-$(AICP_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(AICP_BUILDTYPE)$(AICP_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    aicp.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.aicp.version=$(AICP_VERSION) \
    ro.modversion=$(AICP_MOD_VERSION) \
    ro.aicp.buildtype=$(AICP_BUILDTYPE)

include vendor/aicp/config/aicp_version.mk

# AICP OTA
ifneq ($(AICP_BUILDTYPE),UNOFFICIAL)
PRODUCT_PACKAGES +=  \
   AICP_OTA_Updater
endif

# Google sounds
include vendor/aicp/google/GoogleAudio.mk

EXTENDED_POST_PROCESS_PROPS := vendor/aicp/tools/aicp_process_props.py
