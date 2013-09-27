# Inherit AOSP device configuration for tsubasa
$(call inherit-product, device/sony/tsubasa/full_tsubasa.mk)

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# tsubasa overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/tsubasa

# Setup device specific product configuration.
PRODUCT_NAME := aicp_tsubasa
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := tsubasa
PRODUCT_MODEL := LT25i
PRODUCT_MANUFACTURER := Sony

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT25i BUILD_FINGERPRINT=Sony/LT25i_1268-6904/LT25i:4.1.2/9.1.A.0.490/Ff5_tw:user/release-keys PRIVATE_BUILD_DESC="LT25i-user 4.1.2 9.1.A.0.490 Ff5_tw test-keys"

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true


# boot animation
PRODUCT_COPY_FILES += \
	vendor/aicp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
