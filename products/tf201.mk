# Inherit device configuration for tf201.
$(call inherit-product, device/asus/tf201/full_tf201.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aicp/configs/common_tablet.mk)


# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=EeePad BUILD_FINGERPRINT=asus/US_epad/EeePad:4.1.1/JRO03C/US_epad-10.4.2.18-20121122:user/release-keys PRIVATE_BUILD_DESC="US_epad-user 4.1.1 JRO03C US_epad-10.4.2.18-20121122 release-keys"

#
# Device naming
#
PRODUCT_DEVICE := tf201
PRODUCT_NAME := aicp_tf201
PRODUCT_BRAND := asus
PRODUCT_MODEL := EPAD
PRODUCT_MANUFACTURER := asus
