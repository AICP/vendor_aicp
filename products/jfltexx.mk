$(call inherit-product, device/samsung/jfltexx/full_jfltexx.mk)

# jfltexx overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/jf-common

# Specify phone tech before including full_phone
$(call inherit-product, vendor/aicp/configs/gsm.mk)
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=jfltexx TARGET_DEVICE=jfltexx BUILD_FINGERPRINT="samsung/jfltexx/jflte:4.2.2/JDQ39/I9505XXUAMDE:user/release-keys" 
PRIVATE_BUILD_DESC="jfltexx-user 4.2.2 JDQ39 I9505XXUAMDE release-keys"

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

PRODUCT_DEVICE := jfltexx
PRODUCT_NAME := aicp_jfltexx
