# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

$(call inherit-product, device/motorola/condor/full_condor.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aicp_condor
PRODUCT_RELEASE_NAME := MOTO E

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
-include vendor/aicp/configs/bootanimation.mk
