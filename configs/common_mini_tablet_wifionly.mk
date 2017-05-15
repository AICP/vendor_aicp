ifeq ($(WITH_SU),true)
    SUPERUSER_EMBEDDED := true
endif

# Common overlay
DEVICE_PACKAGE_OVERLAYS += vendor/aicp/overlay/common_tablet

# Inherit common product packages
-include vendor/aicp/configs/common_packages.mk

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
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

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/configs/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# Installer
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/persist.sh:install/bin/persist.sh \
    vendor/aicp/prebuilt/common/etc/persist.conf:system/etc/persist.conf

PRODUCT_COPY_FILES += \
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

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Antimony.ogg \
    ro.config.alarm_alert=Scandium.ogg

PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Inherit common build.prop overrides
-include vendor/aicp/configs/common_versions.mk
-include vendor/aicp/configs/partner_gms.mk

# Theme engine
-include vendor/aicp/configs/themes_common.mk

ifneq ($(TARGET_DISABLE_CMSDK), true)
# CMSDK
include vendor/aicp/configs/cmsdk_common.mk
endif

# Copy Magisk zip
#PRODUCT_COPY_FILES += \
#    vendor/aicp/prebuilt/common/magisk.zip:system/addon.d/magisk.zip

# Copy latinime for gesture typing
#PRODUCT_COPY_FILES += \
#    vendor/aicp/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Include AICP LatinIME dictionaries
#PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/dictionaries

# Kernel Adiutor App
# PRODUCT_COPY_FILES += \
#    vendor/aicp/prebuilt/common/app/KernelAdiutor.apk:system/priv-app/KernelAdiutor/KernelAdiutor.apk

# AdAway App
# PRODUCT_COPY_FILES += \
#    vendor/aicp/prebuilt/common/app/AdAway.apk:system/priv-app/AdAway/AdAway.apk

# AICP memo App
# PRODUCT_COPY_FILES += \
#    vendor/aicp/prebuilt/common/app/AICP-memo.apk:system/priv-app/AICP-memo/AICP-memo.apk

# -include vendor/cyngn/product.mk

# AICP OTA
ifneq ($(AICP_BUILDTYPE),UNOFFICIAL)
PRODUCT_PACKAGES +=  \
   AICP_OTA
endif
