#Permissions and Lib for Verizon Wireless Apps
PRODUCT_PACKAGES += \
    VerizonSSO \
    CellBroadcastReceiver

PRODUCT_COPY_FILES += \
    vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml:system/etc/permissions/com.vzw.hardware.ehrpd.xml \
    vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.hardware.lte.xml:system/etc/permissions/com.vzw.hardware.lte.xml \
    vendor/aokp/prebuilt/vzw/etc/permissions/com.vzw.vzwapnlib.xml:system/etc/permissions/com.vzw.vzwapnlib.xml \
    vendor/aokp/prebuilt/vzw/lib/libmotricity.so:system/lib/libmotricity.so

PRODUCT_GMS_CLIENTID_BASE := android-verizon
