LOCAL_PATH:= $(call my-dir)
LLVM50_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM50_ROOT_PATH)/llvm.mk

support_SRC_FILES := \
  AMDGPUCodeObjectMetadata.cpp \
  APFloat.cpp \
  APInt.cpp \
  APSInt.cpp \
  ARMBuildAttrs.cpp \
  ARMAttributeParser.cpp \
  ARMWinEH.cpp \
  Allocator.cpp \
  BinaryStreamError.cpp \
  BinaryStreamReader.cpp \
  BinaryStreamRef.cpp \
  BinaryStreamWriter.cpp \
  BlockFrequency.cpp \
  BranchProbability.cpp \
  CachePruning.cpp \
  circular_raw_ostream.cpp \
  Chrono.cpp \
  COM.cpp \
  CommandLine.cpp \
  Compression.cpp \
  ConvertUTF.cpp \
  ConvertUTFWrapper.cpp \
  CrashRecoveryContext.cpp \
  DataExtractor.cpp \
  Debug.cpp \
  DebugCounter.cpp \
  DeltaAlgorithm.cpp \
  DAGDeltaAlgorithm.cpp \
  Error.cpp \
  ErrorHandling.cpp \
  FileUtilities.cpp \
  FileOutputBuffer.cpp \
  FoldingSet.cpp \
  FormattedStream.cpp \
  FormatVariadic.cpp \
  GlobPattern.cpp \
  GraphWriter.cpp \
  Hashing.cpp \
  IntEqClasses.cpp \
  IntervalMap.cpp \
  JamCRC.cpp \
  LEB128.cpp \
  LineIterator.cpp \
  Locale.cpp \
  LockFileManager.cpp \
  LowLevelType.cpp \
  ManagedStatic.cpp \
  MathExtras.cpp \
  MemoryBuffer.cpp \
  MD5.cpp \
  NativeFormatting.cpp \
  Options.cpp \
  Parallel.cpp \
  PluginLoader.cpp \
  PrettyStackTrace.cpp \
  RandomNumberGenerator.cpp \
  Regex.cpp \
  ScaledNumber.cpp \
  ScopedPrinter.cpp \
  SHA1.cpp \
  SmallPtrSet.cpp \
  SmallVector.cpp \
  SourceMgr.cpp \
  SpecialCaseList.cpp \
  Statistic.cpp \
  StringExtras.cpp \
  StringMap.cpp \
  StringPool.cpp \
  StringSaver.cpp \
  StringRef.cpp \
  SystemUtils.cpp \
  TarWriter.cpp \
  TargetParser.cpp \
  ThreadPool.cpp \
  Timer.cpp \
  ToolOutputFile.cpp \
  TrigramIndex.cpp \
  Triple.cpp \
  Twine.cpp \
  Unicode.cpp \
  YAMLParser.cpp \
  YAMLTraits.cpp \
  raw_os_ostream.cpp \
  raw_ostream.cpp \
  regcomp.c \
  regerror.c \
  regexec.c \
  regfree.c \
  regstrlcpy.c \
  xxhash.cpp \
  Atomic.cpp \
  DynamicLibrary.cpp \
  Errno.cpp \
  Host.cpp \
  Memory.cpp \
  Mutex.cpp \
  Path.cpp \
  Process.cpp \
  Program.cpp \
  RWMutex.cpp \
  Signals.cpp \
  TargetRegistry.cpp \
  ThreadLocal.cpp \
  Threading.cpp \
  Valgrind.cpp \
  Watchdog.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

# FIXME: This only requires RTTI because tblgen uses it.  Fix that.
REQUIRES_RTTI := 1

LOCAL_SRC_FILES := $(support_SRC_FILES)

LOCAL_MODULE:= libLLVM50Support

LOCAL_CFLAGS := -D__android__

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM50_HOST_BUILD_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(support_SRC_FILES)

LOCAL_MODULE:= libLLVM50Support

LOCAL_CFLAGS := -D__android__

include $(LLVM50_DEVICE_BUILD_MK)
include $(BUILD_STATIC_LIBRARY)
endif
