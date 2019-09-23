# Allow vendor/extra to override any property by setting it first
$(call inherit-product-if-exists, vendor/extra/product.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Include AICP version
include vendor/aicp/config/aicp_version.mk

# Include AICP packages
include vendor/aicp/config/aicp_packages.mk

# Include AICP version
include vendor/aicp/config/aicp_props.mk

# Include AOSP audio files
include vendor/aicp/config/aosp_audio.mk

# Google sounds
include vendor/aicp/google/GoogleAudio.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/common

# TWRP
ifeq ($(BUILD_TWRP),true)
RECOVERY_TYPE := twrp
else
RECOVERY_TYPE := aosp
endif

# Copy all AICP specific init rc files
$(foreach f,$(wildcard vendor/aicp/prebuilt/common/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Do not include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Clean cache script
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/clean_cache.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/clean_cache.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init.d/00banner:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/00banner \
    vendor/aicp/prebuilt/common/bin/sysinit:$(TARGET_COPY_OUT_SYSTEM)/bin/sysinit

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aicp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aicp/prebuilt/common/bin/50-aicp.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-aicp.sh \
    vendor/aicp/prebuilt/common/bin/blacklist:$(TARGET_COPY_OUT_SYSTEM)/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/aicp/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/aicp/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# AICP permissions
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/privapp-permissions-aicp.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-aicp.xml \
    vendor/aicp/config/permissions/com.aicp.extras.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.aicp.extras.xml \
    vendor/aicp/config/permissions/org.lineage.snap.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.lineage.snap.xml \
    vendor/aicp/config/permissions/com.aicp.updater3.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.aicp.updater3.xml \

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/lineage-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/lineage-hiddenapi-package-whitelist.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/aicp-power-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/aicp-power-whitelist.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/content-types.properties:$(TARGET_COPY_OUT_SYSTEM)/lib/content-types.properties

# Omnijaws
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/org.omnirom.omnijaws.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.omnirom.omnijaws.xml

# Google extra permissions and features
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/android.software.live_wallpaper.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.live_wallpaper.xml \
    vendor/aicp/config/permissions/com.google.android.dialer.support.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.google.android.dialer.support.xml \
    vendor/aicp/config/permissions/com.google.android.feature.ANDROID_ONE_EXPERIENCE.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.google.android.feature.ANDROID_ONE_EXPERIENCE.xml \
    vendor/aicp/config/permissions/privapp-permissions-platform.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-platform.xml \
    vendor/aicp/config/permissions/privapp-permissions-google.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-google.xml \
    vendor/aicp/config/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-hotword.xml \
    vendor/aicp/config/permissions/google_build.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google_build.xml \
    vendor/aicp/config/permissions/google-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
    vendor/aicp/config/permissions/hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-package-whitelist.xml \
    vendor/aicp/config/permissions/nexus.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/nexus.xml \
    vendor/aicp/config/permissions/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pixel_2016_exclusive.xml \
    vendor/aicp/config/permissions/pixel_2017_exclusive.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pixel_2017_exclusive.xml \
    vendor/aicp/config/permissions/pixel_2018_exclusive.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pixel_2018_exclusive.xml \
    vendor/aicp/config/permissions/pixel_2019_midyear_exclusive.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pixel_2019_midyear_exclusive.xml \
    vendor/aicp/config/permissions/pixel_experience_2017.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pixel_experience_2017.xml \
    vendor/aicp/config/permissions/pixel_experience_2018.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pixel_experience_2018.xml \
    vendor/aicp/config/permissions/pixel_experience_2019_midyear.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pixel_experience_2019_midyear.xml

# Google extra libraries (sketch/swipe)
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/libsketchology_native.so:$(TARGET_COPY_OUT_SYSTEM)/lib/libsketchology_native.so \
    vendor/aicp/prebuilt/common/lib64/libsketchology_native.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/libsketchology_native.so

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false
