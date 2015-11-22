# Release name
PRODUCT_RELEASE_NAME := t0lteatt

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/t0lteatt/full_t0lteatt.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := t0lteatt
PRODUCT_NAME := aicp_t0lteatt
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SAMSUNG-SGH-I317
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=t0lteatt TARGET_DEVICE=t0lteatt BUILD_FINGERPRINT="samsung/t0lteatt/t0lteatt:4.1.2/JZO54K/I317UCAMA4:user/release-keys" PRIVATE_BUILD_DESC="t0lteatt-user 4.1.2 JZO54K I317UCAMA4 release-keys"


# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk
