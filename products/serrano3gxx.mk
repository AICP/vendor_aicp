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
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit AOSP device configuration for serrano3gxx.
$(call inherit-product, device/samsung/serrano3gxx/device.mk)

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=serrano3gxx \
    TARGET_DEVICE=serrano3g \
    BUILD_FINGERPRINT="samsung/serrano3gxx/serrano3g:4.4.2/KOT49H/I9190XXUCNG1:user/release-keys" \
    PRIVATE_BUILD_DESC="serrano3gxx-user 4.4.2 KOT49H I9190XXUCNG1 release-keys"

# Setup device specific product configuration.
PRODUCT_NAME := aicp_serrano3gxx
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := serrano3gxx
PRODUCT_MODEL := GT-I9190
PRODUCT_MANUFACTURER := Samsung

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="doc HD (semdoc)"

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
-include vendor/aicp/configs/bootanimation.mk
