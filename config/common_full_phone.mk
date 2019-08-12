# Inherit common stuff
$(call inherit-product, vendor/aicp/config/common.mk)
$(call inherit-product, vendor/aicp/config/common_apn.mk)

# Telephony
PRODUCT_PACKAGES += \
    Stk

# SMS
PRODUCT_PACKAGES += \
    messaging

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/dictionaries
