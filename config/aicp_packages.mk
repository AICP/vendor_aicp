# AICP packages
PRODUCT_PACKAGES += \
    AicpExtras \
    TilesWallpaper

# AICP Ad-block
PRODUCT_PACKAGES += \
    hosts.aicp_adblock

# AICP OTA
ifneq ($(AICP_BUILDTYPE),UNOFFICIAL)
PRODUCT_PACKAGES +=  \
   Updater

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init/init.aicp-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.aicp-updater.rc
endif

# A/B OTA Optimization
ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script
endif

# AicpSetupWizard
#ifneq ($(WITH_GMS),true)
#PRODUCT_PACKAGES += \
#    AicpSetupWizard
#endif

# Bootanimation include
PRODUCT_PACKAGES += \
    bootanimation.zip

# Custom off-mode charger
PRODUCT_PACKAGES += \
    charger_res_images

ifeq ($(WITH_AICP_CHARGER),true)
PRODUCT_PACKAGES += \
    aicp_charger_res_images \
    font_log.png \
    libhealthd.aicp
endif

# OmniJaws
PRODUCT_PACKAGES += \
    OmniJaws

# Optional packages
PRODUCT_PACKAGES += \
    Aperture \
    AppPredictionService \
    Etar \
    ExactCalculator \
    Glimpse \
    Jelly \
    ThemePicker \
    ThemesStub \
    WallpaperPicker2

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# su
PRODUCT_PACKAGES += \
    adb_root

ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif

# MusicFX
# PRODUCT_PACKAGES += \
#    MusicFX

# Phonograph
# PRODUCT_PACKAGES += \
#    Phonograph

PRODUCT_PACKAGES += \
    GameSpace

# OmniStyle
# PRODUCT_PACKAGES += \
#    OmniStyle

# Config
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/fsck.ntfs \
    system/bin/mkfs.ntfs \
    system/bin/mount.ntfs \
    system/%/libfuse-lite.so \
    system/%/libntfs-3g.so

# Extra tools
PRODUCT_PACKAGES += \
#    7z \
    bash \
    curl \
    getcap \
    htop \
#    lib7z \
    libsepol \
    nano \
#    pigz \
    powertop \
    rsync \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip \
    zstd

# AICP overlays
-include packages/overlays/AICP/product_packages.mk
