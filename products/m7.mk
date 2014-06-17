$(call inherit-product, device/htc/m7/full_m7.mk)

$(call inherit-product, vendor/aicp/configs/gsm.mk)

$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=KTU84L.H4 BUILD_FINGERPRINT="htc/m7_google/m7:4.4.3/KTU84L.H4/347097:user/release-keys" PRIVATE_BUILD_DESC="4.07.1700.4 CL347097 release-keys"

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/bootanimation/bootanimation_1080_1920.zip:system/media/bootanimation-alt.zip

PRODUCT_NAME := aicp_m7
PRODUCT_DEVICE := m7

