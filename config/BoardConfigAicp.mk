# Charger
ifeq ($(WITH_AICP_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.aicp
endif
