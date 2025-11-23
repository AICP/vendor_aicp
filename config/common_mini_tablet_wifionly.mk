# Inherit mobile mini common Lineage stuff
$(call inherit-product, vendor/aicp/config/common_mobile_mini.mk)

# Inherit tablet common Lineage stuff
$(call inherit-product, vendor/aicp/config/tablet.mk)

$(call inherit-product, vendor/aicp/config/wifionly.mk)
