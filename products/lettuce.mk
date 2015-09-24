# Copyright (C) 2014 The CyanogenMod Project
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

$(call inherit-product, device/yu/lettuce/full_lettuce.mk)

# Inherit some common ACIP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

PRODUCT_NAME := aicp_lettuce
BOARD_VENDOR := yu
PRODUCT_DEVICE := lettuce

PRODUCT_GMS_CLIENTID_BASE := android-micromax

TARGET_VENDOR_PRODUCT_NAME := YUPHORIA
TARGET_VENDOR_DEVICE_NAME := YUPHORIA
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=YUPHORIA PRODUCT_NAME=YUPHORIA

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=YU/YUPHORIA/YUPHORIA:5.0.2/LRX22G/YNG1TBS2P2:user/release-keys \
    PRIVATE_BUILD_DESC="YUPHORIA-user 5.0.2 LRX22G YNG1TBS2P2 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Parth B (TheStrix)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk
