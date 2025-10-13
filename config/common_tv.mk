# Inherit common Aicp stuff
$(call inherit-product, vendor/aicp/config/common.mk)

# Include AOSP audio files
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioTv.mk)

# Inherit Aicp atv device tree
$(call inherit-product, device/lineage/atv/lineage_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Aicp packages
PRODUCT_PACKAGES += \
    Catapult \
    AicpCustomizer

PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/tv
