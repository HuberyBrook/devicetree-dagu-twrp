#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
    LOCAL_MODULE := prebuilt
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_CLASS := ETC
    LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)
    LOCAL_HOST_REQUIRED_MODULES := depmod
    LOCAL_POST_INSTALL_CMD += \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib/modules; \
        cp -rf $(LOCAL_PATH)/modules $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib/; \
        $(DEPMOD) -b $(TARGET_RECOVERY_ROOT_OUT)/vendor 1.1;
include $(BUILD_PHONY_PACKAGE)
