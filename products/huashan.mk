# Inherit AICP device configuration for huashan
$(call inherit-product-if-exists, device/sony/huashan/aicp.mk)

# huashan overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/huashan

# Setup device specific product configuration.
PRODUCT_NAME := aicp_huashan
PRODUCT_BRAND := Sony
PRODUCT_DEVICE := huashan
PRODUCT_MODEL := Xperia SP
PRODUCT_MANUFACTURER := Sony

# boot animation
PRODUCT_COPY_FILES += \
	vendor/aicp/prebuilt/bootanimation/bootanimation_720_1280.zip:system/media/bootanimation-alt.zip
