PRODUCT_BRAND ?= AICP

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# Default notification/alarm sounds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Hassium.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
endif

ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/data/cache
else
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/cache
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aicp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aicp/prebuilt/common/bin/50-aicp.sh:system/addon.d/50-aicp.sh \
    vendor/aicp/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Lineage-specific broadcast actions whitelist
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/lineage-sysconfig.xml:system/etc/sysconfig/lineage-sysconfig.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/aicp/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Copy all Lineage-specific init rc files
$(foreach f,$(wildcard vendor/aicp/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is AICP!
PRODUCT_COPY_FILES += \
    vendor/aicp/config/permissions/org.lineageos.android.xml:system/etc/permissions/org.lineageos.android.xml \
    vendor/aicp/config/permissions/privapp-permissions-lineage.xml:system/etc/permissions/privapp-permissions-lineage.xml

# Include AICP audio files
include vendor/aicp/config/aicp_audio.mk

# Fix Google dialer
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

ifneq ($(TARGET_DISABLE_LINEAGE_SDK), true)
# Lineage SDK
include vendor/aicp/config/lineage_sdk_common.mk
endif

# TWRP
ifeq ($(WITH_TWRP),true)
include vendor/aicp/config/twrp.mk
endif

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# Required AICP packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    LineageParts \
    Development \
    Profiles

# Optional packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker \
    PhotoTable \
    Terminal

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Custom Lineage packages
PRODUCT_PACKAGES += \
    AudioFX \
    LineageSettingsProvider \
    LineageSetupWizard \
    Eleven \
    ExactCalculator \
    Jelly \
    LockClock \
    Trebuchet \
    Updater \
    WallpaperPicker \
    WeatherProvider

# Custom AICP packages
PRODUCT_PACKAGES += \
    AicpExtras

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Berry styles
PRODUCT_PACKAGES += \
    LineageAmberAccent \
    LineageBlackAccent \
    LineageBrownAccent \
    LineageCyanAccent \
    LineageDenimAccent \
    LineageGoldAccent \
    LineageGreenAccent \
    LineageGreyAccent \
    LineageLavaAccent \
    LineageOrangeAccent \
    LineagePinkAccent \
    LineagePurpleAccent \
    LineageRedAccent \
    LineageTealAccent \
    LineageYellowAccent

# Default dark theme
PRODUCT_PACKAGES += \
    DefaultDark-System \
    DefaultDark-SystemUI \
    DefaultDark-Settings \
    DefaultDark-LineageParts \
    DefaultDark-Calculator \
    DefaultBlack-System \
    DefaultBlack-SystemUI

# Extra tools in AICP
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Turbo
PRODUCT_PACKAGES += \
    Turbo

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_AICP_CHARGER),true)
PRODUCT_PACKAGES += \
    lineage_charger_res_images \
    font_log.png \
    libhealthd.aicp
endif

# exFAT tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Disable rescue party
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.disable_rescue=true

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# Google Assistant
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.opa.eligible_device=true

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank

# Conditionally build in su
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

DEVICE_PACKAGE_OVERLAYS += vendor/aicp/overlay/common

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/aicp/config/partner_gms.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)

# AICP Versioning
-include vendor/aicp/config/version.mk

# AICP OTA
ifneq ($(AICP_BUILDTYPE),UNOFFICIAL)
PRODUCT_PACKAGES +=  \
   AICP_OTA
endif

# Omni Packages
PRODUCT_PACKAGES += \
    OmniJaws \
    OmniStyle \
    OmniSwitch

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils
