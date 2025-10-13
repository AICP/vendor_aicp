# Inherit mobile full common Lineage stuff
$(call inherit-product, vendor/aicp/config/common_mobile_full.mk)

# Inherit tablet common Lineage stuff
$(call inherit-product, vendor/aicp/config/tablet.mk)

$(call inherit-product, vendor/aicp/config/telephony.mk)
