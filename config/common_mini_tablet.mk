# Inherit mini common AICP stuff
$(call inherit-product, vendor/aicp/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/aicp/config/telephony.mk)
