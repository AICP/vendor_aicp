# Copyright (C) 2016 The AICP Project
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

$(call inherit-product, device/google/seed/full_seed.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8916

PRODUCT_NAME := aicp_seed
BOARD_VENDOR := google
PRODUCT_DEVICE := seed

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := Google Seed

PRODUCT_BRAND := Google
TARGET_VENDOR := Google
TARGET_VENDOR_PRODUCT_NAME := Seed
TARGET_VENDOR_DEVICE_NAME := seed

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Vedat Ak (Wzedlare), Kaan Külahlı (Rygebin)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=seed \
     BUILD_FINGERPRINT=google/seed_l8150/seed:7.1.1/N4F26P/3587886:user/release-keys \
     PRIVATE_BUILD_DESC="seed_l8150-user 7.1.1 N4F26P 3587886 release-keys"

