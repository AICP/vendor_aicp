# Inherit AOSP device configuration for hayabusa
$(call inherit-product, device/sony/hayabusa/full_hayabusa.mk)

# Inherit common product files.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# hayabusa overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aokp/overlay/hayabusa

# Setup device specific product configuration.
PRODUCT_NAME := aokp_hayabusa
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := hayabusa
PRODUCT_MODEL := LT29i
PRODUCT_MANUFACTURER := Sony

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT29i BUILD_FINGERPRINT=Sony/LT29i_1266-3318/LT29i:4.1.2/9.1.B.0.411/ZL5_tw:user/release-keys PRIVATE_BUILD_DESC="LT29i-user 4.1.2 9.1.B.0.411 ZL5_tw test-keys"

#skip asserts for now
TARGET_OTA_ASSERT_SKIP := true


# boot animation
PRODUCT_COPY_FILES += \
	vendor/aokp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
