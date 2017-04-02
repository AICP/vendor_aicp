# Copyright (C) 2016 The CyanogenMod Project
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
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from x2 device
$(call inherit-product, device/leeco/x2/device.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

PRODUCT_NAME := aicp_x2
PRODUCT_DEVICE := x2
PRODUCT_MANUFACTURER := LeMobile
PRODUCT_BRAND := LeEco

PRODUCT_GMS_CLIENTID_BASE := android-letv

TARGET_VENDOR_PRODUCT_NAME := LeMax2
TARGET_VENDOR_DEVICE_NAME := le_x2
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=le_x2 PRODUCT_NAME=LeMax2

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=LeEco/LeMax2_NA/le_x2_na:7.1.1/FIXNAOP5801607182S/letv07181411:user/release-keys \
    PRIVATE_BUILD_DESC="le_x2_na-user 7.1.1 FIXNAOP5801607182S eng.letv.20160718.140847 release-keys"

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += ro.product.model

TARGET_VENDOR := leeco
