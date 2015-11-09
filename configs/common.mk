SUPERUSER_EMBEDDED := true

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/common

# Common dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/dictionaries

PRODUCT_PACKAGES += \
    BluetoothExt \
    CellBroadcastReceiver \
    libemoji \
    LatinImeDictionaryPack \
    Microbes \
    Stk \
    su \
    procmem \
    procrank \
    Superuser \
    Torch

# AICP packages
PRODUCT_PACKAGES += \
    PhotoPhase \
    Trebuchet \
    Eleven \
    Development \
    LockClock \
    AICP_OTA \
    AudioFX \
    PhotoPhase \
    CMFileManager \
    OmniSwitch \
    WhisperPush \
    Profiles \
    WallpaperPicker \
    CMSettingsProvider

# Extra tools in CM
PRODUCT_PACKAGES += \
    vim \
    zip \
    unrar \
    curl

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enterprise_mode=1 \
    ro.kernel.android.checkjni=0 \
    persist.sys.root_access=3 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aicp/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aicp/prebuilt/bin/blacklist:system/addon.d/blacklist

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# Installer
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/persist.sh:install/bin/persist.sh \
    vendor/aicp/prebuilt/common/etc/persist.conf:system/etc/persist.conf

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/libmicrobes_jni.so:system/lib/libmicrobes_jni.so \
    vendor/aicp/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# init.d
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init.local.rc:root/init.cm.rc \
    vendor/aicp/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/aicp/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/aicp/prebuilt/common/etc/init.d/99crontab:system/etc/init.d/99crontab \
    vendor/aicp/prebuilt/common/etc/init.d/99trim_partitions:system/etc/init.d/99trim_partitions \
    vendor/aicp/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/aicp/prebuilt/common/etc/cron.d/root:system/etc/cron.d/root \
    vendor/aicp/prebuilt/common/bin/trim_partitions:system/bin/trim_partitions \
    vendor/aicp/prebuilt/common/bin/sysinit:system/bin/sysinit

# Bring in camera effects
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/aicp/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    libssh \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh \
    sftp \
    scp \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    ntfsfix \
    ntfs-3g

WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Scarabaeus.ogg \
    ro.config.notification_sound=Antimony.ogg \
    ro.config.alarm_alert=Scandium.ogg

PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Inherit common build.prop overrides
-include vendor/aicp/configs/common_versions.mk

# T-Mobile theme engine
-include vendor/aicp/configs/themes_common.mk

# CM Platform Library
PRODUCT_PACKAGES += \
    org.cyanogenmod.platform-res \
    org.cyanogenmod.platform \
    org.cyanogenmod.platform.xml

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# World APNs
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/aicp/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Kernel Adiutor App
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/app/KernelAdiutor.apk:system/priv-app/KernelAdiutor/KernelAdiutor.apk

# AdAway App
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/app/AdAway.apk:system/priv-app/AdAway/AdAway.apk

ifndef CM_PLATFORM_SDK_VERSION
  # This is the canonical definition of the SDK version, which defines
  # the set of APIs and functionality available in the platform.  It
  # is a single integer that increases monotonically as updates to
  # the SDK are released.  It should only be incremented when the APIs for
  # the new release are frozen (so that developers don't write apps against
  # intermediate builds).
  CM_PLATFORM_SDK_VERSION := 3
endif

# CyanogenMod Platform SDK Version
PRODUCT_PROPERTY_OVERRIDES += \
  ro.cm.build.version.plat.sdk=$(CM_PLATFORM_SDK_VERSION)

# -include vendor/cyngn/product.mk

# OTA
# PRODUCT_COPY_FILES +=  \
#    vendor/aicp/proprietary/AICP_OTA.apk:system/priv-app/AICP_OTA.apk
