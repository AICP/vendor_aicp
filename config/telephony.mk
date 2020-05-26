# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/aicp/prebuilt/common/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver

# Dual SIM - allow setting calling account to 'Ask every time'
# rather than resetting to sub 1 every boot
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.radio.aosp_usr_pref_sel=true

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true
