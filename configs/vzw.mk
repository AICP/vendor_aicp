#Permissions and Lib for Verizon Wireless Apps based on Unified devices
#GMS Client ID is only set on devices that are compiled specifically for vzw I.E. d2vzw not d2lte

ifeq ($(VZW_UNIFIED),true)
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/vzw/app/VerizonSSO.apk:system/blobs/vzw/app/VerizonSSO.apk \
    vendor/aicp/prebuilt/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml:system/blobs/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml \
    vendor/aicp/prebuilt/vzw/etc/permissions/com.vzw.hardware.lte.xml:system/blobs/vzw/etc/permissions/com.vzw.hardware.lte.xml \
    vendor/aicp/prebuilt/vzw/etc/permissions/com.vzw.vzwapnlib.xml:system/blobs/vzw/etc/permissions/com.vzw.vzwapnlib.xml \
    vendor/aicp/prebuilt/vzw/lib/libmotricity.so:system/blobs/vzw/lib/libmotricity.so
else
PRODUCT_PACKAGES += \
    VerizonSSO

PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/vzw/etc/permissions/com.vzw.hardware.ehrpd.xml:system/etc/permissions/com.vzw.hardware.ehrpd.xml \
    vendor/aicp/prebuilt/vzw/etc/permissions/com.vzw.hardware.lte.xml:system/etc/permissions/com.vzw.hardware.lte.xml \
    vendor/aicp/prebuilt/vzw/etc/permissions/com.vzw.vzwapnlib.xml:system/etc/permissions/com.vzw.vzwapnlib.xml \
    vendor/aicp/prebuilt/vzw/lib/libmotricity.so:system/lib/libmotricity.so

PRODUCT_GMS_CLIENTID_BASE := android-verizon
endif
