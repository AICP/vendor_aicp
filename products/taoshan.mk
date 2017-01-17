# Copyright (C) 2013 The CyanogenMod Project
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

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit device configuration
$(call inherit-product, device/sony/taoshan/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := taoshan
PRODUCT_NAME := aicp_taoshan
PRODUCT_BRAND := Sony
PRODUCT_MODEL := Xperia L
PRODUCT_MANUFACTURER := Sony
PRODUCT_CHARACTERISTICS := phone

# Release name
PRODUCT_RELEASE_NAME := taoshan

# Build fingerprints
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=C2105 \
    BUILD_FINGERPRINT="Sony/C2105/C2105:4.2.2/15.3.A.1.17/Android.1016:user/release-keys" \
    PRIVATE_BUILD_DESC="C2105-user 4.2.2 JDQ39 Android.1016 test-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Sudokamikaze"

# Boot animation
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480
-include vendor/aicp/configs/bootanimation.mk
