#
# Copyright (C) 2017 The AICP Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common AICP stuff
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit from Z00ED device
$(call inherit-product, device/asus/Z00ED/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := aicp_Z00ED
PRODUCT_DEVICE := Z00ED
PRODUCT_BRAND := asus
PRODUCT_MODEL := Zenfone 2 Laser
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
DEVICE_MAINTAINERS="Kaan Külahlı (Rygebin)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

-include vendor/aicp/configs/bootanimation.mk
