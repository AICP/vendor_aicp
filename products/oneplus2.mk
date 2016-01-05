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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from bacon device
$(call inherit-product, device/oneplus/oneplus2/oneplus2.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Enhanced NFC
$(call inherit-product, vendor/aicp/configs/nfc_enhanced.mk)

# Inherit some common AICP stuff
$(call inherit-product, vendor/aicp/configs/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := aicp_oneplus2
PRODUCT_DEVICE := oneplus2
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_MODEL := A0001

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BRAND := oneplus
TARGET_VENDOR := oneplus
TARGET_VENDOR_PRODUCT_NAME := oneplus2
TARGET_VENDOR_DEVICE_NAME := oneplus2
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=oneplus2 PRODUCT_NAME=oneplus2

## Use the latest approved GMS identifiers unless running a signed build
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=OnePlus/OnePlus2/oneplus2:6.0.1/MMB29M/2431559:userdebug/dev-keys
PRIVATE_BUILD_DESC="oneplus2-userdebug 6.0.1 MMB29M 2431559 dev-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Domenic Schaller"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk
