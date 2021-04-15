# Allow vendor/extra to override any property by setting it first
$(call inherit-product-if-exists, vendor/extra/product.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Include AICP version
include vendor/aicp/config/aicp_version.mk

# Include AICP packages
include vendor/aicp/config/aicp_packages.mk

# Include AICP version
include vendor/aicp/config/aicp_props.mk

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.recovery_update=true
endif

# Include AOSP audio files
include vendor/aicp/config/aosp_audio.mk

# Google sounds
include vendor/aicp/google/GoogleAudio.mk

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/aicp/overlay
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

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

# Clean cache script
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/clean_cache.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/clean_cache.sh

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aicp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aicp/prebuilt/common/bin/50-aicp.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-aicp.sh

ifneq ($(strip $(AB_OTA_PARTITIONS) $(AB_OTA_POSTINSTALL_CONFIG)),)
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/aicp/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/aicp/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif
endif

# system mount
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/system-mount.sh:install/bin/system-mount.sh

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    Launcher3QuickStep

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml \
    vendor/aicp/config/permissions/privapp-permissions-livedisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-livedisplay.xml

# AICP permissions
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/privapp-permissions-aicp-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-aicp.xml \
    vendor/aicp/config/permissions/privapp-permissions-aicp-system-ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-aicp.xml \
    vendor/aicp/config/permissions/privapp-permissions-aicp-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-aicp.xml

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/lineage-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/lineage-hiddenapi-package-whitelist.xml

# Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/aicp/prebuilt/common/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    vendor/aicp/prebuilt/common/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# Enable Android Beam on all targets
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/android.software.nfc.beam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.nfc.beam.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.sip.voip.xml

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/content-types.properties:$(TARGET_COPY_OUT_SYSTEM)/lib/content-types.properties

# Google extra permissions and features
PRODUCT_COPY_FILES += \
#    vendor/aicp/config/permissions/android.software.live_wallpaper.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.live_wallpaper.xml \
    vendor/aicp/config/permissions/com.google.android.dialer.support.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.dialer.support.xml \
    vendor/aicp/config/permissions/com.google.android.feature.ANDROID_ONE_EXPERIENCE.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.google.android.feature.ANDROID_ONE_EXPERIENCE.xml \
#    vendor/aicp/config/permissions/privapp-permissions-platform.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-platform.xml \
    vendor/aicp/config/permissions/privapp-permissions-google.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-google.xml \
    vendor/aicp/config/permissions/privapp-permissions-google-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-product.xml \
    vendor/aicp/config/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-hotword.xml \
    vendor/aicp/config/permissions/google_build.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/aicp_google_build.xml \
    vendor/aicp/config/permissions/google-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
#    vendor/aicp/config/permissions/hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-package-whitelist.xml \
    vendor/aicp/config/permissions/nexus.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/nexus.xml \
    vendor/aicp/config/permissions/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2016_exclusive.xml \
    vendor/aicp/config/permissions/pixel_2017_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2017_exclusive.xml \
    vendor/aicp/config/permissions/pixel_2018_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2018_exclusive.xml \
    vendor/aicp/config/permissions/pixel_2019_midyear_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2019_midyear_exclusive.xml \
    vendor/aicp/config/permissions/pixel_experience_2017.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_experience_2017.xml \
    vendor/aicp/config/permissions/pixel_experience_2018.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_experience_2018.xml \
    vendor/aicp/config/permissions/pixel_experience_2019_midyear.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_experience_2019_midyear.xml

# Google extra libraries (sketch/swipe)
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/libsketchology_native.so:$(TARGET_COPY_OUT_SYSTEM)/lib/libsketchology_native.so \
    vendor/aicp/prebuilt/common/lib64/libsketchology_native.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/libsketchology_native.so
