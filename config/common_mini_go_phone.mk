# Set Aicp specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common Aicp stuff
$(call inherit-product, vendor/aicp/config/common_mini_phone.mk)
