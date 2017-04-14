# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from n1awifi device
$(call inherit-product, device/samsung/n1awifi/device.mk)

PRODUCT_BRAND := samsung

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)

PRODUCT_NAME := aicp_n1awifi
PRODUCT_DEVICE := n1awifi
PRODUCT_MANUFACTURER := samsung
PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=SM-P600 \
    PRODUCT_NAME=n1awifi \
    PRODUCT_DEVICE=n1awifi \
    TARGET_DEVICE=n1awifi \
    BUILD_FINGERPRINT="samsung/lt03wifiue/lt03wifiue:5.1.1/LMY47X/P600UEUDOK1:user/release-keys" \
    PRIVATE_BUILD_DESC="lt03wifiue-user 5.1.1 LMY47X P600UEUDOK1 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Moshe Bararsh (mosimchah)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 2560
-include vendor/aicp/configs/bootanimation.mk
