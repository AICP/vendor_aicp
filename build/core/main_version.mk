# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
PRODUCT_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# additions for LOS-recovery
PRODUCT_SYSTEM_PROPERTIES += \
    ro.lineage.build.version=$(VERSION) \
    ro.lineage.version=-$(shell date +%Y%m%d)_$(shell date +%H%M%S)-

