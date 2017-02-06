# Required CM packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    CMAudioService \
    CMParts \
    Development \
    Profiles \
    WeatherManagerService

# Optional CM packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker \
    PhotoTable

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Custom CM packages
PRODUCT_PACKAGES += \
    AudioFX \
    CMFileManager \
    CMSettingsProvider \
    Eleven \
    ExactCalculator \
    LiveLockScreenService \
    LockClock \
    Trebuchet \
    WallpaperPicker \
    WeatherProvider \
    Terminal \
    Recorder

# AICP packages
PRODUCT_PACKAGES += \
    AicpExtras \
    BasicDreams \
    Browser2 \
    LatinImeDictionaryPack \
    LatinIME \
    librs_jni \
    LiveWallpapers \
    MagicSmokeWallpapers \
    OmniSwitch \
    PhotoPhase \
    procmem \
    procrank \
    Torch \
    VisualizationWallpapers

# Conditionally build in su
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif

# OmniRom packages
PRODUCT_PACKAGES += \
    OmniStyle

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in AICP
PRODUCT_PACKAGES += \
    7z \
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

# Custom off-mode charger
ifneq ($(WITH_CM_CHARGER),false)
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images \
    font_log.png \
    libhealthd.cm
endif

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

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

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

#DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# OMS MASQUERADE
PRODUCT_PACKAGES += \
   masquerade

# OMS Verified
PRODUCT_PROPERTY_OVERRIDES := \
    ro.substratum.verified=true

# Magisk Manager
PRODUCT_PACKAGES += \
    MagiskManager
