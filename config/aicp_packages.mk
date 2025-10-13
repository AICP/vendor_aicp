# AICP packages
PRODUCT_PACKAGES += \
    AicpExtras \
    TilesWallpaper

# AICP Ad-block
PRODUCT_PACKAGES += \
    hosts.aicp_adblock

# AICP OTA
ifneq ($(AICP_BUILDTYPE),UNOFFICIAL)
PRODUCT_PACKAGES +=  \
   Updater

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init/init.aicp-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.aicp-updater.rc
endif

# A/B OTA Optimization
ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script
endif

# Bootanimation include
PRODUCT_PACKAGES += \
    bootanimation.zip

# Custom off-mode charger
PRODUCT_PACKAGES += \
    charger_res_images

ifeq ($(WITH_AICP_CHARGER),true)
PRODUCT_PACKAGES += \
    aicp_charger_res_images \
    font_log.png \
    libhealthd.aicp
endif

# OmniJaws
PRODUCT_PACKAGES += \
    OmniJaws

# Optional packages
PRODUCT_PACKAGES += \
    AppPredictionService \
    WallpaperPicker2

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs

# Extra tools
PRODUCT_PACKAGES += \
    libsepol \
    powertop \
    unzip \
    wget \
    zip

# AICP-specific init rc file
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init/init.aicp-system_ext.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.aicp-system_ext.rc \
    vendor/aicp/prebuilt/common/etc/init/init.openssh.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.openssh.rc

# AICP overlays
-include packages/overlays/AICP/product_packages.mk
