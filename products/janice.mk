# Inherit AOSP device configuration for janice
$(call inherit-product, device/samsung/janice/full_janice.mk)
 
# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)
 
# Inherit GSM common stuff
$(call inherit-product, vendor/aicp/configs/gsm.mk)
 
# Overlay
#PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/janice
 
# Setup device specific product configuration
PRODUCT_DEVICE := janice
PRODUCT_NAME := aicp_janice
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-I9070
PRODUCT_MANUFACTURER := samsung
 
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9070 TARGET_DEVICE=GT-I9070
 
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_480_800.zip:system/media/bootanimation.zip

