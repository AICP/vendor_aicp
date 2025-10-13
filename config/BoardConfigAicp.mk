# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE ?= true

# Charger
ifeq ($(WITH_AICP_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.aicp
endif

# things to be set on AB devices
ifeq ($(TARGET_IS_AB_DEVICE),true)
    AB_OTA_UPDATER := true
endif


ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    include hardware/qcom-caf/common/BoardConfigQcom.mk
endif

include vendor/aicp/config/BoardConfigKernel.mk

include vendor/aicp/config/BoardConfigSoong.mk


