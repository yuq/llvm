LOCAL_PATH := $(call my-dir)

LLVM_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-nm command line tool
#===---------------------------------------------------------------===

llvm_nm_SRC_FILES := \
  llvm-nm.cpp

llvm_nm_STATIC_LIBRARIES := \
  libLLVM50ARMCodeGen \
  libLLVM50ARMInfo \
  libLLVM50ARMDesc \
  libLLVM50ARMAsmPrinter \
  libLLVM50ARMAsmParser \
  libLLVM50ARMDisassembler \
  libLLVM50AArch64CodeGen \
  libLLVM50AArch64Info \
  libLLVM50AArch64AsmParser \
  libLLVM50AArch64Desc \
  libLLVM50AArch64AsmPrinter \
  libLLVM50AArch64Utils \
  libLLVM50AArch64Disassembler \
  libLLVM50MipsCodeGen \
  libLLVM50MipsInfo \
  libLLVM50MipsAsmParser \
  libLLVM50MipsDesc \
  libLLVM50MipsAsmPrinter \
  libLLVM50MipsDisassembler \
  libLLVM50X86Info \
  libLLVM50X86Desc \
  libLLVM50X86AsmPrinter \
  libLLVM50X86AsmParser \
  libLLVM50X86CodeGen \
  libLLVM50X86Utils \
  libLLVM50X86Disassembler \
  libLLVM50CodeGen \
  libLLVM50TransformUtils \
  libLLVM50Target \
  libLLVM50Analysis \
  libLLVM50Object             \
  libLLVM50BitReader          \
  libLLVM50MC                 \
  libLLVM50MCParser           \
  libLLVM50Core               \
  libLLVM50Support            \
  libLLVM50MCDisassembler \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-nm
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_nm_SRC_FILES)

LOCAL_STATIC_LIBRARIES := $(llvm_nm_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM_ROOT_PATH)/llvm.mk
include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
