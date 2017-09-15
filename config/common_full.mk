# Inherit common AICP stuff
$(call inherit-product, vendor/aicp/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
