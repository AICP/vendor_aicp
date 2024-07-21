$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit mini common AICP stuff
$(call inherit-product, vendor/aicp/config/common_mini.mk)

# Inherit tablet common AICP stuff
$(call inherit-product, vendor/aicp/config/tablet.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
