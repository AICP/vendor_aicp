# Charger
ifeq ($(WITH_AICP_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.aicp
endif

# things to be set on AB devices
ifeq ($(TARGET_IS_AB_DEVICE),true)
    AB_OTA_UPDATER := true
endif

ifneq ($(TARGET_USES_KERNEL_PLATFORM),true)
include vendor/aicp/config/BoardConfigKernel.mk
endif

ifeq ($(TARGET_KERNEL_CLANG_VERSION),latest)
include prebuilts/clang/host/linux-x86_custom/clang_custom.mk
endif
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/aicp/config/BoardConfigQcom.mk
endif

include vendor/aicp/config/BoardConfigSoong.mk
