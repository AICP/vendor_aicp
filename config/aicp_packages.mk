# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \

# Optional packages
PRODUCT_PACKAGES += \
    ThemePicker \
    WallpaperPicker2

# su
PRODUCT_PACKAGES += \
    adb_root

ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif

# Extra Optional packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    Email \
    Etar \
    ExactCalculator \
    Exchange2

#AicpSetupWizard
ifneq ($(WITH_GMS),true)
PRODUCT_PACKAGES += \
    AicpSetupWizard
endif

# MusicFX
PRODUCT_PACKAGES += \
    MusicFX

# Phonograph
# PRODUCT_PACKAGES += \
    Phonograph

# Jelly
PRODUCT_PACKAGES += \
    Jelly

# PRODUCT_PACKAGES += \
    GameSpace

# OnDeviceAppPrediction
PRODUCT_PACKAGES += \
    AppPredictionService

# OmniJaws
PRODUCT_PACKAGES += \
    OmniJaws

# OmniStyle
# PRODUCT_PACKAGES += \
    OmniStyle

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# Config
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    ntfsfix \
    ntfs-3g \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

PRODUCT_PACKAGES += \
    charger_res_images

# Custom off-mode charger
ifeq ($(WITH_AICP_CHARGER),true)
PRODUCT_PACKAGES += \
    aicp_charger_res_images \
    font_log.png \
    libhealthd.aicp
endif

# Extra tools
PRODUCT_PACKAGES += \
    bash \
    curl \
    getcap \
    htop \
    libsepol \
    nano \
    powertop \
    setcap \
    unzip \
    vim \
    wget \
    zip

# A/B OTA Optimization
ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script
endif

# Bootanimation include
PRODUCT_PACKAGES += \
    bootanimation.zip

# AICP OTA
ifneq ($(AICP_BUILDTYPE),UNOFFICIAL)
PRODUCT_PACKAGES +=  \
   Updater

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/init/init.aicp-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.aicp-updater.rc
endif

# AICP packages
PRODUCT_PACKAGES += \
    AicpExtras \
    AicpThemesStub \
    TilesWallpaper

# AICP Ad-block
PRODUCT_PACKAGES += \
    hosts.aicp_adblock

-include packages/overlays/AICP/product_packages.mk
