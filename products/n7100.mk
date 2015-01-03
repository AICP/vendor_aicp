# Inherit common device configuration 
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n7100/full_n7100.mk)

# Release name
PRODUCT_RELEASE_NAME := n7100


# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n7100
PRODUCT_NAME := aicp_n7100
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N7100
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=t03gxx TARGET_DEVICE=t03g BUILD_FINGERPRINT="samsung/t03gxx/t03g:4.3/JSS15J/N7100XXUENB2:user/release-keys" PRIVATE_BUILD_DESC="t03gxx-user 4.3 JSS15J N7100XXUENB2 release-keys"


# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk
