# Inherit mobile full common Aicp stuff
$(call inherit-product, vendor/aicp/config/common_mobile_full.mk)

# Inherit tablet common Aicp stuff
$(call inherit-product, vendor/aicp/config/tablet.mk)

$(call inherit-product, vendor/aicp/config/wifionly.mk)
