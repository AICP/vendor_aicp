# Inherit AOSP device configuration for d800
$(call inherit-product, device/lge/d800/d800.mk)

# Inherit AICP common bits
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# d800 overlay
# PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/d800

# Device identifier
PRODUCT_DEVICE := d800
PRODUCT_NAME := aicp_d800
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D800
PRODUCT_MANUFACTURER := lge

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
