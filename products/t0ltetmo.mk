# Release name
PRODUCT_RELEASE_NAME := t0ltetmo

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/t0ltetmo/full_t0ltetmo.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := t0ltetmo
PRODUCT_NAME := aicp_t0ltetmo
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SGH-T889
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=t0ltetmo TARGET_DEVICE=t0ltetmo BUILD_FINGERPRINT="samsung/t0ltetmo/t0ltetmo:4.1.2/JZO54K/T889UVBMB4:user/release-keys" PRIVATE_BUILD_DESC="t0ltetmo-user 4.1.2 JZO54K T889UVBMB4 release-keys"


# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk
