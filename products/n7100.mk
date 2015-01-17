#
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
#

# Inherit common product files.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/n7100/full_n7100.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := n7100
PRODUCT_RELEASE_NAME := n7100
PRODUCT_NAME := aicp_n7100
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N7100
PRODUCT_MANUFACTURER := samsung

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=t03gxx \
    TARGET_DEVICE=t03g \
    PRIVATE_BUILD_DESC="t03gxx-user 4.3 JSS15J N7100XXUENB2 release-keys" \
    BUILD_FINGERPRINT="samsung/t03gxx/t03g:4.3/JSS15J/N7100XXUENB2:user/release-keys"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk

