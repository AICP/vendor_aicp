# Inherit 64-bit configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit device configuration
$(call inherit-product, device/nextbit/ether/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aicp_ether
BOARD_VENDOR := nextbit
TARGET_VENDOR := nextbit
PRODUCT_DEVICE := ether

# AICP Device Info
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Sean Hoyt (Deadman96385)"

PRODUCT_BRAND := Nextbit
PRODUCT_MODEL := Robin
PRODUCT_MANUFACTURER := Nextbit

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Nextbit/ether/ether:6.0.1/MMB29M/00WW_1_350:user/release-keys \
    PRIVATE_BUILD_DESC="ether-user 6.0.1 MMB29M 00WW_1_350 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk