#
# Copyright (C) 2015 The Android Open Source Project
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

LOCAL_PATH:= $(call my-dir)

LLVM50_ROOT_PATH := $(LOCAL_PATH)/../../
include $(LLVM50_ROOT_PATH)/llvm.mk

# For the host only
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

LOCAL_MODULE := LLVM50gold

LOCAL_MODULE_CLASS := SHARED_LIBRARIES

llvm_gold_SRC_FILES := \
  gold-plugin.cpp

LOCAL_SRC_FILES := $(llvm_gold_SRC_FILES)

LOCAL_SHARED_LIBRARIES := libLLVM50

ifndef USE_MINGW
LOCAL_LDLIBS += -lpthread -ldl
endif

LOCAL_C_INCLUDES += toolchain/binutils/binutils-2.25/include

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(LLVM50_GEN_INTRINSICS_MK)
include $(BUILD_HOST_SHARED_LIBRARY)
