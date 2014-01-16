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

# Inherit device configuration
$(call inherit-product, device/samsung/hltetmo/full_hltetmo.mk)

## Specify phone tech before including full_phone
$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/aokp/configs/common.mk)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=hltetmo TARGET_DEVICE=hltetmo BUILD_FINGERPRINT="samsung/hltetmo/hltetmo:4.3/JSS15J/N900TUVUBMI7:user/release-keys" PRIVATE_BUILD_DESC="hltetmo-user 4.3 JSS15J N900TUVUBMI7 release-keys"

## Device identifier. This must come after all inclusions
PRODUCT_NAME := aokp_hltetmo
PRODUCT_DEVICE := hltetmo
PRODUCT_MODEL := SM-N900T
