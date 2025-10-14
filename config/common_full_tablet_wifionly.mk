$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit full common AICP stuff
$(call inherit-product, vendor/aicp/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include AICP LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aicp/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/aicp/overlay/dictionaries
