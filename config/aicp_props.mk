# Storage manager
PRODUCT_PRODUCT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Disable rescue party
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.disable_rescue=true

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.recovery_update=true
endif
