# Inherit AOSP device configuration for i605.
$(call inherit-product, device/samsung/i605/full_i605.mk)

# Inherit common cdma apns
$(call inherit-product, vendor/aicp/configs/cdma.mk)

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/t0ltecdma

# Setup device specific product configuration.
PRODUCT_NAME := aicp_i605
PRODUCT_BRAND := Samsung
PRODUCT_DEVICE := i605
PRODUCT_MODEL := SCH-I605
PRODUCT_MANUFACTURER := Samsung

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=t0ltevzw TARGET_DEVICE=t0ltevzw BUILD_FINGERPRINT="Verizon/t0ltevzw/t0ltevzw:4.3/JSS15J/I605VRUEMJ9:user/release-keys" PRIVATE_BUILD_DESC="t0ltevzw-user 4.3 JSS15J I605VRUEMJ9 release-keys"

# boot animation
PRODUCT_COPY_FILES += \
vendor/aicp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
