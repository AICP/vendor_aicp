# Charger
ifeq ($(WITH_AICP_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.aicp
endif

# QCOM HW crypto
ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)
    TARGET_CRYPTFS_HW_PATH ?= vendor/qcom/opensource/cryptfs_hw
endif
