#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/dagu

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Release name
PRODUCT_RELEASE_NAME := dagu

## Device identifier
PRODUCT_DEVICE := dagu
PRODUCT_NAME := twrp_dagu
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Pad 5 Pro 12.4
PRODUCT_MANUFACTURER := Xiaomi

# Assert
TARGET_OTA_ASSERT_DEVICE := $(PRODUCT_RELEASE_NAME)

# Theme
TW_STATUS_ICONS_ALIGN := center
TW_Y_OFFSET := 91
TW_H_OFFSET := -91
