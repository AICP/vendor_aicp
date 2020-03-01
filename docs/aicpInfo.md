Optional AICP (and general) overlays to add
-------------------------------
Add if the device has a high aspect ratio (mostly 18:9 or 19:9):
```
<bool name="config_haveHigherAspectRatioScreen">true</bool>
```

To enable double tap to wake (if your device supports it):
```
<bool name="config_supportDoubleTapWake">true</bool>
```

To adjust the cpu temp path for the cpu info option in aicp extras (note: This should only be added if it doesn't show the temp by default and you will have to find the right path for your device):
```
<string name="config_cpuTempSensor">/sys/class/thermal/thermal_zone7/temp</string>
```

To enable call recording (add to: overlay/packages/apps/Dialer/java/com/android/dialer/callrecord/res/values/config.xml):
```
<bool name="call_recording_enabled">true</bool>
```
Most devices also need this for call recording to work properly (add to: same file as the above overlay XML):
```
<integer name="call_recording_audio_source">4</integer>
```

To enable AOD (Always On Display) - Please think twice before doing so:
```
<bool name="config_dozeAlwaysOnDisplayAvailable">true</bool>
```

Most devices need this as well for AOD:
```
<bool name="config_displayBlanksAfterDoze">true</bool>
```

To disable AOD by default:
```
<bool name="config_dozeAlwaysOnEnabled">false</bool>
```

To force apps to assume that you don't have a menu key (useful for older apps, if you don't use the nav bar):
```
<integer name="config_overrideHasPermanentMenuKey">2</integer>
```

To boost the brightness on a triple press of the power button:
```
<integer name="config_triplePressOnPowerBehavior">2</integer>
```

To enable statusbar burn-in protection (Amoled only):
```
<bool name="config_enableBurnInProtection">true</bool>
```

To enable smart pixels (Amoled only):
```
<bool name="config_enableSmartPixels">true</bool>
```

Enable the HWC setColorTransform function so it can be performed efficiently in hardware:
```
<bool name="config_setColorTransformAccelerated">true</bool>
```

Enable this if you want to give wellbeing trust permissions:
```
<string name="config_defaultWellbeingPackage">com.google.android.apps.wellbeing</string>
```

You might want to use this if your device isn't friendly with EGL rendering, useful for legacy devices:
```
<bool name="config_animateScreenLights">false</bool>
```

If your device has high aspect ratio then you know what to do:
```
<bool name="config_haveHigherAspectRatioScreen">true</bool>
```

If you run qcacld-3.0 wifi driver, you might as well use this for wifi random mac generation, useful when logging in public networks:
```
<bool name="config_wifi_support_connected_mac_randomization_supported">true</bool>
```

If your device is somewhat decent, like a sm8150 one, you can use this to enable 802.11r support (Fast BSS Transition):
```
<bool translatable="false" name="config_wifi_fast_bss_transition_enabled">true</bool>
```

Useful if you have qcacld-3.0 on a decent platform:
```
<bool translatable="false" name="config_wifi_batched_scan_supported">true</bool>
```

Normally you don't have to do this, but I've had weird issues running on a 5Ghz network, indicate that you support both of the two bands(2,4Ghz and 5Ghz):
```
<bool translatable="false" name="config_wifi_dual_band_support">true</bool>
```

Useful if you want to improve signal reception:
```
<bool name="config_ignoreRssnrSignalLevel">true</bool>
```

Optional AICP packages to add (in device.mk)
-------------------------------

To build our fork of the Lineage Snap camera:
```
PRODUCT_PACKAGES += \
    Snap
```

To include JamesDSP instead of MusicFX:

Note:

>This will not work on devices that use the stock vendor image

>You will also have to add the audio effect

>Pick this if you have audio_effects.xml: https://gerrit.aicp-rom.com/c/AICP/device_htc_hima-common/+/79367

>Pick this if you have audio_effects.conf: https://gerrit.aicp-rom.com/c/AICP/device_oneplus_msm8998-common/+/79640
```
PRODUCT_PACKAGES += \
    JamesDSPManager
```

Optional AICP packages to remove (in BoardConfig.mk)
-------------------------------

To remove MusicFX (and ship without any included equalizer app):
```
TARGET_USE_MUSICFX := false
```

Add if you have an A/B device:
```
TARGET_IS_AB_DEVICE := true
```

Add if your device has a vendor partiton, but does not build the vendor image with the ROM zip:
```
BUILD_WITHOUT_VENDOR := true
```


For prebuilt twrp on a/b devices:
-------------------------------

Replicate https://github.com/AICP/device_twrp

Get twrp.img for your device
```

abootimg -x twrp.img
```

mv initrd.img initrd.gz
```

gunzip initrd.gz
```

mkdir tmp
```

cd tmp
```

cpio -m -i <../initrd
```

zip -ry ../ramdisk-recovery.zip *
```
If your twrp ramdisk includes unusual file names it may break the build, such as [ and [[ from busybox, if your twrp includes them, then they need to be deleted before zipping the ramdisk, create the symlinks in init.recovery.rc if they're important
