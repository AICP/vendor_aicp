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
    mGerrit \
    Microbes \
    ROMControl \
    Stk \
    su \
    SwagPapers \
    Torch

# AICP packages
PRODUCT_PACKAGES += \
    OmniSwitch \
    DashClock \
    KernelTweaker \
    Apollo \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf \
    EOSWeather \
    PhotoPhase \
    MonthCalendarWidget

## Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

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
    persist.sys.root_access=3

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/aicp/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/aicp/prebuilt/bin/blacklist:system/addon.d/blacklist

# Installer
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/persist.sh:install/bin/persist.sh \
    vendor/aicp/prebuilt/common/etc/persist.conf:system/etc/persist.conf

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/libmicrobes_jni.so:system/lib/libmicrobes_jni.so \
    vendor/aicp/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# init.d
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init.local.rc:root/init.aicp.rc \
    vendor/aicp/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/aicp/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/aicp/prebuilt/common/etc/init.d/99crontab:system/etc/init.d/99crontab \
    vendor/aicp/prebuilt/common/etc/init.d/99trim_partitions:system/etc/init.d/99trim_partitions \
    vendor/aicp/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/aicp/prebuilt/common/etc/cron.d/root:system/etc/cron.d/root \
    vendor/aicp/prebuilt/common/bin/trim_partitions:system/bin/trim_partitions \
    vendor/aicp/prebuilt/common/bin/sysinit:system/bin/sysinit

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
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

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

# common boot animation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# World APNs
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# HFM Files
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/etc/hosts.alt:system/etc/hosts.alt \
    vendor/aicp/prebuilt/etc/hosts.og:system/etc/hosts.og

# OTA
PRODUCT_COPY_FILES +=  \
    vendor/aicp/proprietary/AICP_OTA.apk:system/priv-app/AICP_OTA.apk

