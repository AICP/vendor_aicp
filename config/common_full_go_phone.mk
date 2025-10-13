# Set Aicp specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit full common Aicp stuff
$(call inherit-product, vendor/aicp/config/common_full_phone.mk)
