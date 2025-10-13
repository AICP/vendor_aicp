# SPDX-FileCopyrightText: 2024 The AicpOS Project
# SPDX-License-Identifier: Apache-2.0

$(call inherit-product, device/google/cuttlefish/vsoc_x86_64/tv/aosp_cf.mk)

include vendor/aicp/build/target/product/lineage_generic_tv_target.mk

TARGET_NO_KERNEL_OVERRIDE := true

# Overrides
PRODUCT_NAME := lineage_cf_tv_x86_64
PRODUCT_MODEL := AicpOS Cuttlefish TV built for x86_64
