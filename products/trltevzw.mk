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

# Inherit common AICP phone.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

$(call inherit-product, device/samsung/trltevzw/full_trltevzw.mk)

PRODUCT_NAME := aicp_trltevzw

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="trltevzw" \
    PRODUCT_NAME="trltevzw" \
    BUILD_FINGERPRINT="samsung/trltevzw/trltevzw:4.4.4/KTU84P/N910VVRU1ANJ5:user/release-keys" \
    PRIVATE_BUILD_DESC="trltevzw-user 4.4.4 KTU84P N910VVRU1ANJ5 release-keys"

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="doc HD (semdoc)"

#Bootanimation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440
-include vendor/aicp/configs/bootanimation.mk
