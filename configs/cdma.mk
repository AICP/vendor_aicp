# CDMA APN list
PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/common/etc/apns-conf-cdma.xml:system/etc/apns-conf.xml

PRODUCT_PROPERTY_OVERRIDES += \
    gsm.current.phone-type=2
