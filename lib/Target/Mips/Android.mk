LOCAL_PATH := $(call my-dir)

mips_codegen_TBLGEN_TABLES50 := \
  MipsGenRegisterInfo.inc \
  MipsGenInstrInfo.inc \
  MipsGenCodeEmitter.inc \
  MipsGenMCCodeEmitter.inc \
  MipsGenMCPseudoLowering.inc \
  MipsGenAsmWriter.inc \
  MipsGenDAGISel.inc \
  MipsGenFastISel.inc \
  MipsGenCallingConv.inc \
  MipsGenSubtargetInfo.inc \
  MipsGenDisassemblerTables.inc \
  MipsGenAsmMatcher.inc

mips_codegen_SRC_FILES := \
  Mips16FrameLowering.cpp \
  Mips16HardFloat.cpp \
  Mips16HardFloatInfo.cpp \
  Mips16InstrInfo.cpp \
  Mips16ISelDAGToDAG.cpp \
  Mips16ISelLowering.cpp \
  Mips16RegisterInfo.cpp \
  MipsAnalyzeImmediate.cpp \
  MipsAsmPrinter.cpp \
  MipsCCState.cpp \
  MipsConstantIslandPass.cpp \
  MipsDelaySlotFiller.cpp \
  MipsFastISel.cpp \
  MipsHazardSchedule.cpp \
  MipsInstrInfo.cpp \
  MipsISelDAGToDAG.cpp \
  MipsISelLowering.cpp \
  MipsFrameLowering.cpp \
  MipsLongBranch.cpp \
  MipsMCInstLower.cpp \
  MipsMachineFunction.cpp \
  MipsModuleISelDAGToDAG.cpp \
  MipsOptimizePICCall.cpp \
  MipsOs16.cpp \
  MipsRegisterInfo.cpp \
  MipsSEFrameLowering.cpp \
  MipsSEInstrInfo.cpp \
  MipsSEISelDAGToDAG.cpp \
  MipsSEISelLowering.cpp \
  MipsSERegisterInfo.cpp \
  MipsSubtarget.cpp \
  MipsTargetMachine.cpp \
  MipsTargetObjectFile.cpp \
  MicroMipsSizeReduction.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

LOCAL_MODULE:= libLLVM50MipsCodeGen
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(mips_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc

TBLGEN_TABLES50 := $(mips_codegen_TBLGEN_TABLES50)

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(LLVM50_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

LOCAL_MODULE:= libLLVM50MipsCodeGen

LOCAL_SRC_FILES := $(mips_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc

TBLGEN_TABLES50 := $(mips_codegen_TBLGEN_TABLES50)

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(LLVM50_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
