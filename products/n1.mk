# Inherit common device configuration for n1
$(call inherit-product, vendor/aicp/configs/common.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit device configuration for n1.
$(call inherit-product, device/oppo/n1/full_n1.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n1
PRODUCT_NAME := aicp_n1
PRODUCT_BRAND := Oppo
PRODUCT_MODEL := N1
PRODUCT_MANUFACTURER := Oppo

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=find5 BUILD_FINGERPRINT=OPPO/oppo_13055/N1:4.2.2/JDQ39/1386254481:user/release-keys PRIVATE_BUILD_DESC="msm8960-user 4.2.2 JDQ39 eng.root.20131205.093833 release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
