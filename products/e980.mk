# Inherit AOSP device configuration
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit AOSP device configuration for device
$(call inherit-product, device/lge/e980/full_e980.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080


# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := e980
PRODUCT_NAME := aicp_e980
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-E980
PRODUCT_MANUFACTURER := LGE

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=geefhd_open_eu BUILD_FINGERPRINT=lge/geefhd_open_eu/geefhd:4.1.2/JZO54K/E98610b.1373081564:user/release-keys PRIVATE_BUILD_DESC="geefhd_open_eu-user 4.1.2 JZO54K E98610b.1373081564 release-keys"


# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk
