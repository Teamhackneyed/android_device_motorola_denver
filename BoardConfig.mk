#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/denver

# Inherit from motorola sm6375-common
include device/motorola/sm6375-common/BoardConfigCommon.mk

# Audio
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := denver

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
ODM_MANIFEST_SKUS += b d
ODM_MANIFEST_B_FILES := $(DEVICE_PATH)/sku/manifest_b.xml
ODM_MANIFEST_D_FILES := $(DEVICE_PATH)/sku/manifest_d.xml

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=denver
TARGET_KERNEL_CONFIG += vendor/ext_config/moto-holi-denver.config

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 6169821184 # (BOARD_SUPER_PARTITION_SIZE / 2) - 4MB
BOARD_SUPER_PARTITION_SIZE := 13958643712

# Power
TARGET_TAP_TO_WAKE_NODE := /sys/class/touchscreen/primary/gesture

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Security
BOOT_SECURITY_PATCH := 2025-04-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 13
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 13

# inherit from the proprietary version
include vendor/motorola/denver/BoardConfigVendor.mk
