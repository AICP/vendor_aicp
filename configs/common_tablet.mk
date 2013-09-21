# Inherit common stuff
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/common_tablet

