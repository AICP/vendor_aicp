# gps
#PRODUCT_COPY_FILES += \
#    vendor/carbon/prebuilt/common/etc/gps.conf:system/etc/gps.conf

# spn
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml

# apns
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

PRODUCT_PROPERTY_OVERRIDES += \
    gsm.current.phone-type=1
