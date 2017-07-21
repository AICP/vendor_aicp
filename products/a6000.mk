#
# Copyright (C) 2017 The LineageOS Project
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
#

# Inherit Stuffs From a6000
$(call inherit-product, device/lenovo/a6000/full_a6000.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)
TARGET_BOARD_PLATFORM_VARIANT := msm8916

PRODUCT_NAME := aicp_a6000
BOARD_VENDOR := Lenovo

PRODUCT_GMS_CLIENTID_BASE := android-lenovo

# Build fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="Lenovo/Kraft-A6000/Kraft-A6000:5.0.2/LRX22G/Kraft-A6000_S061_160727:user/release-keys" \
    PRIVATE_BUILD_DESC="Kraft-A6000-user 5.0.2 LRX22G Kraft-A6000_S061_160727 release-keys"

# AICP Device Maintainer
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Harshit Jain (dev_harsh1998)"

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280
-include vendor/aicp/configs/bootanimation.mk
