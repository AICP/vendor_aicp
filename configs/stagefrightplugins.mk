# Stagefright FFMPEG plugin
ifneq ($(TARGET_PRODUCT),aicp_m8)
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser
endif
