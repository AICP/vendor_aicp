# Charger
#ifneq ($(WITH_CM_CHARGER),false)
#    BOARD_HAL_STATIC_LIBRARIES := libhealthd.cm
#endif
# things to be set on devices, which build vendor
ifneq ($(TARGET_BUILD_WITHOUT_VENDOR),true)
    TARGET_USE_JAMESDSP := true
endif

ifeq ($(TARGET_USE_MUSICFX),false)
    TARGET_USE_NO_MUSICFX := true
endif

include vendor/aicp/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/aicp/config/BoardConfigQcom.mk
endif

include vendor/aicp/config/BoardConfigSoong.mk
