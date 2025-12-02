# AICP packages
PRODUCT_PACKAGES += \
    AicpExtras \
    TilesWallpaper

# AICP Ad-block
PRODUCT_PACKAGES += \
    hosts.aicp_adblock

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
    e2fsck \
    libsepol \
    mke2fs \
    tune2fs \
    wget

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/Alarm_Classic.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Alarm_Classic.ogg \
    $(LOCAL_PATH)/alarms/ogg/Krypton.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Krypton-old.ogg \
    $(LOCAL_PATH)/alarms/ogg/Neon.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Neon-old.ogg \
    $(LOCAL_PATH)/alarms/ogg/Osmium.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Osmium-old.ogg \
    $(LOCAL_PATH)/alarms/ogg/Oxygen.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Oxygen-old.ogg \
    $(LOCAL_PATH)/alarms/ogg/Platinum.ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/Platinum-old.ogg \

# AICP overlays
-include packages/overlays/AICP/product_packages.mk
