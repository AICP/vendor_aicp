# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Charger
ifeq ($(WITH_AICP_CHARGER),true)
    BOARD_HAL_STATIC_LIBRARIES := libhealthd.aicp
endif

# things to be set on AB devices
ifeq ($(TARGET_IS_AB_DEVICE),true)
    AB_OTA_UPDATER := true
endif

include vendor/aicp/config/BoardConfigKernel.mk
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    include vendor/aicp/config/BoardConfigQcom.mk
endif

include vendor/aicp/config/BoardConfigSoong.mk
