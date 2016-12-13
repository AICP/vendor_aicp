$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

$(call inherit-product, device/htc/jewel/jewel.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jewel BUILD_ID=JSS15Q BUILD_FINGERPRINT="htc/sprint_wwe/jewel:4.3/JSS15Q/310297.4:user/release-keys" PRIVATE_BUILD_DESC="4.13.651.4 CL310297 release-keys"

# Device naming
PRODUCT_DEVICE := jewel
PRODUCT_NAME := aicp_jewel
PRODUCT_BRAND := htc
PRODUCT_MODEL := EVO
PRODUCT_MANUFACTURER := HTC

# Release name
PRODUCT_RELEASE_NAME := jewel

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk
