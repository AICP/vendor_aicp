$(call inherit-product, device/samsung/jfltevzw/full_jfltevzw.mk)

$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
  PRODUCT_NAME=jfltevzw \
  TARGET_DEVICE=jfltevzw \
  BUILD_FINGERPRINT="Verizon/jfltevzw/jfltevzw:5.0.1/LRX22C/I545VRSGPL1:user/release-keys" \
  PRIVATE_BUILD_DESC="jfltevzw-user 5.0.1 LRX22C I545VRSGPL1 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon

PRODUCT_NAME := aicp_jfltevzw
PRODUCT_DEVICE := jfltevzw

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
  DEVICE_MAINTAINERS="doc HD (semdoc)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk
