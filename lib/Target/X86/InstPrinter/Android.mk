LOCAL_PATH := $(call my-dir)

x86_instprinter_TBLGEN_TABLES50 := \
  X86GenAsmWriter.inc \
  X86GenAsmWriter1.inc \
  X86GenInstrInfo.inc \
  X86GenRegisterInfo.inc \
  X86GenSubtargetInfo.inc

x86_instprinter_SRC_FILES := \
  X86ATTInstPrinter.cpp \
  X86IntelInstPrinter.cpp \
  X86InstComments.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

TBLGEN_TABLES50 := $(x86_instprinter_TBLGEN_TABLES50)

TBLGEN_TD_DIR50 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(x86_instprinter_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM50X86AsmPrinter

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

TBLGEN_TABLES50 := $(x86_instprinter_TBLGEN_TABLES50)

TBLGEN_TD_DIR50 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(x86_instprinter_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE := libLLVM50X86AsmPrinter

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)
