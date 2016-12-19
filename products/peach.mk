# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8916

#Assert
TARGET_OTA_ASSERT_DEVICE := peach,benefit,ark_benefit_a3,benefit_a3,a3,ark

$(call inherit-product, device/ark/peach/full_peach.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

PRODUCT_NAME := aicp_peach
BOARD_VENDOR := ark
PRODUCT_DEVICE := peach

PRODUCT_GMS_CLIENTID_BASE := android-elephone

PRODUCT_MANUFACTURER := ARK
PRODUCT_MODEL := Benefit A3

PRODUCT_BRAND := ARK
TARGET_VENDOR := ark
TARGET_VENDOR_PRODUCT_NAME := peach
TARGET_VENDOR_DEVICE_NAME := peach

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Ilya Lebedev (lolmaxlik)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk
