# Inherit some common Tablet stuff.
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)

# Inherit device configuration for wx_na_wf.
$(call inherit-product, device/nvidia/wx_na_wf/full_wx_na_wf.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=wx_na_wf \
    TARGET_DEVICE=shieldtablet \
    BUILD_FINGERPRINT="nvidia/wx_na_wf/shieldtablet:5.0.1/LRX22C/29082_493.9700:user/release-keys" \
    PRIVATE_BUILD_DESC="wx_na_wf-user 5.0.1 LRX22C 29082_493.9700 release-keys"

PRODUCT_NAME := aicp_wx_na_wf
PRODUCT_DEVICE := wx_na_wf

# Bootanimation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200
-include vendor/aicp/configs/bootanimation.mk
