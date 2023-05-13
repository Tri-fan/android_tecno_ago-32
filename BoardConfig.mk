COMMON_PATH := device/tecno/ago_32
# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := generic

# Bootloader
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
TARGET_BOOTLOADER_BOARD_NAME := CY-BE8RU-XQ662
TW_HAS_NO_RECOVERY_PARTITION := true
TW_INCLUDE_FASTBOOTD := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := true
TARGET_USES_UEFI := true
# maybe bugs if included
TW_INCLUDE_REPACKTOOLS := false

# Prebuilt kernel with dtb
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_PREBUILT_KERNEL := $(COMMON_PATH)/prebuilt/zImage
BOARD_PREBUILT_DTBIMAGE_DIR := $(COMMON_PATH)/prebuilt/main.dtb

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 androidboot.selinux=permissive
#BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x40008000
BOARD_RAMDISK_OFFSET := 0x11b00000
BOARD_TAGS_OFFSET := 0x47880000
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET) --dtb $(BOARD_PREBUILT_DTBIMAGE_DIR) --dtb_offset $(BOARD_TAGS_OFFSET) --header_version 2 --os_version 12.0.0 --board $(TARGET_BOOTLOADER_BOARD_NAME) 

# Platform
TARGET_BOARD_PLATFORM := mt6761
TARGET_SUPPORTS_64_BIT_APPS := false

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 741949440
BOARD_VENDORIMAGE_PARTITION_SIZE := 290836480
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25674350592
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := false
TARGET_USES_MKE2FS := true

# Dynamic partitions
BOARD_SUPER_PARTITION_SIZE := 4294967296
BOARD_SUPER_PARTITION_GROUPS := main_a main_b
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 741949440
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 290836480
BOARD_SUPER_PARTITION_PRODUCT_DEVICE_SIZE := 1394868224
BOARD_SUPER_PARTITION_SYSTEM_EXT_DEVICE_SIZE := 891244544
BOARD_MAIN_A_PARTITION_LIST := system_a system_ext_a product_a vendor_a dtbo_a gz_a lk_a logo_a md1img_a scp_a spmfw_a  sspm_a tee_a tkv_a vbmeta_a vbmeta_system_a vbmeta_vendor_a vendor_boot_a
BOARD_MAIN_B_PARTITION_LIST := system_b system_ext_b product_b vendor_b dtbo_b gz_b lk_b logo_b md1img_b scp_b spwfw_b sspm_b tee_b tkv_b vbmeta_b vbmeta_system_b vbmeta_vendor_b vendor_boot_b

#BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
#TARGET_COPY_OUT_ODM := odm
#BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
#TARGET_COPY_OUT_PRODUCT := product
#BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
#TARGET_COPY_OUT_VENDOR := vendor

# Workaround for error copying vendor files to recovery ramdisk
#BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
#TARGET_COPY_OUT_VENDOR := vendor

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := "10"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := false
TW_INCLUDE_NTFS_3G := false
TW_THEME := portrait_hdpi
TW_INCLUDE_RESETPROP := true
TW_USE_TOOLBOX := true
TW_HAS_EDL_MODE := false
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.date.utc;ro.build.date;ro.build.fingerprint=ro.system.build.fingerprint"

# TWRP Debug Flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace

# Set language ru
TW_DEFAULT_LANGUAGE := ru

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := false
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
