#
# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2012 The Carbon Project
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

# name
PRODUCT_RELEASE_NAME := Nexus7LTE

# device
$(call inherit-product, device/asus/deb/aosp_deb.mk)

# tablet
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)

# gsm
$(call inherit-product, vendor/aicp/configs/common_gsm.mk)

# products
PRODUCT_DEVICE := deb
PRODUCT_BRAND := google
PRODUCT_NAME := aicp_deb
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := asus
PRODUCT_PROPERTY_OVERRIDES += ro.buildzipid=aicp.deb.$(shell date +%m%d%y).$(shell date +%H%M%S)

# overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_NUMBER=748593 \
    PRODUCT_NAME=razorg \
    TARGET_BUILD_TYPE=user \
    BUILD_VERSION_TAGS=release-keys \
    PRIVATE_BUILD_DESC="razorg-user 4.3 JSS15J 748593 release-keys" \
    BUILD_FINGERPRINT="google/razorg/deb:4.3/JSS15J/748593:user/release-keys"
