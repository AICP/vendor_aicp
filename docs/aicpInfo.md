Optional AICP (and general) overlays to add
-------------------------------
Framework Overlays (add to overlay/frameworks/base/core/res/res/values/config.xml)

To fully utilize the hardware keys (Wake up the device with keys, enable/disable keys, swap keys, etc. ), the following overlays must be enabled:

```
    <!-- Hardware keys present on the device, stored as a bit field.
         This integer should equal the sum of the corresponding value for each
         of the following keys present:
             1 - Home
             2 - Back
             4 - Menu
             8 - Assistant (search)
            16 - App switch
            32 - Camera
            64 - Volume rocker
         For example, a device with Home, Back and Menu keys would set this
         config to 7. -->
    <integer name="config_deviceHardwareKeys">64</integer>
```

```
    <!-- Hardware keys present on the device with the ability to wake, stored as a bit field.
         This integer should equal the sum of the corresponding value for each
         of the following keys present:
             1 - Home
             2 - Back
             4 - Menu
             8 - Assistant (search)
            16 - App switch
            32 - Camera
            64 - Volume rocker
         For example, a device with Home, Back and Menu keys would set this
         config to 7. -->
    <integer name="config_deviceHardwareWakeKeys">64</integer>
```

Add if the device has a high aspect ratio (mostly 18:9 or 19:9) and you can specify the ratio also:
```
<bool name="config_haveHigherAspectRatioScreen">true</bool>
<item name="config_screenAspectRatio" format="float" type="dimen">2.1</item>
```

To enable double tap to wake (if your device supports it):
```
<bool name="config_supportDoubleTapWake">true</bool>
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

Useful if you have qcacld-3.0 and wifi is always on. This capability can provide power savings when wifi needs to be always kept on.
```
<bool translatable="false" name="config_wifi_background_scan_support">true</bool>
```

If you have an sm8150 device, why not enable WiFi display? The only prerequisite is you must have a rule for the "r_submix" in the audio_policy.conf file.
```
<bool name="config_enableWifiDisplay">true</bool>
```

If you plan to use the above overlay use this as well.
```
<bool name="config_wifiDisplaySupportsProtectedBuffers">true</bool>
```

Control the behavior when the user long presses the home button.
0 = nothing.
1 = Recent apps view in SystemUI.
2 =Launch assist intent.
```
<integer name="config_longPressOnHomeBehavior">X</integer>
```

Useful if you want to improve signal reception:
```
<bool name="config_ignoreRssnrSignalLevel">true</bool>
```

In the case your device has volume rockers on left side and would like audio panel location to appear on the left side:
```
<bool name="config_audioPanelOnLeftSide">false</bool>
```

The System Info feature requires the following overlays to be non-empty to be functional, as some legacy devices do not have the necessary kernel sysfs to display particular sys info.
```
<string name="config_sysCPUTemp">/sys/class/thermal/thermal_zone0/temp</string>
<string name="config_sysBatteryTemp">/sys/class/power_supply/battery/temp</string>
<string name="config_sysGPUFreq">/sys/kernel/gpu/gpu_clock</string>
<string name="config_sysGPULoad">/sys/kernel/gpu/gpu_busy</string>
```

Support for doze triggers are provided using some overlays, which will have to be enabled depending on the device:
```
<bool name="config_dozePulseTilt">false</bool>
<bool name="config_dozePulseProximity">false</bool>
```

AICP also allows full customisation to the notification LED function, some overlays have to be enabled depending on the feature supported by the notification LED on device:
```
<bool name="config_intrusiveBatteryLed">true</bool>
<bool name="config_multiColorBatteryLed">true</bool>
<bool name="config_FastChargingLedSupported">false</bool>
```

If you have a FOD device, it's advised to enable the following overlays:
```
<bool name="config_needCustomFODView">true</bool>
<bool name="config_supportsInDisplayFingerprint">true</bool>
<integer name="config_fingerprintSensorLocation">1</integer>
```

SystemUI Overlays (Controls SystemUI behavior) (add to overlay/frameworks/base/packages/SystemUI/res/values/config.xml)

To adjust the CPU temp path for the CPU info option in aicp extras (note: This should only be added if it doesn't show the temp by default and you will have to find the right path for your device):
```
<string name="config_cpuTempSensor">/sys/class/thermal/thermal_zone7/temp</string>
```

You might also need the following overlay to make the temperature value user-readable
```
<integer name="config_cpuTempDivider" translatable="false">1</integer>
```

The maximum number of notification on the statusbar is currently limited, you can tweak the number of icons using the two overlays:
```
<integer name="config_maxVisibleNotificationIcons">5</integer>
<integer name="config_maxVisibleNotificationIconsOnLock">6</integer>
```

To enable statusbar burn-in protection (Amoled only):
```
<bool name="config_enableBurnInProtection">true</bool>
```

Settings Overlays (add to overlay/packages/apps/Settings/res/values/config.xml)

To enable display touch sensitivity switch:
```
<bool name="config_show_touch_sensitivity">true</bool>
```


Dialer Overlays (add to overlay/packages/apps/Dialer/java/com/android/dialer/callrecord/res/values/config.xml)
To enable call recording:
```
<bool name="call_recording_enabled">true</bool>
```
Most devices also need this for call recording to work properly (add to: same file as the above overlay XML):
```
<integer name="call_recording_audio_source">4</integer>
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

Add if your device has a vendor partition, but does not build the vendor image with the ROM zip:
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

```
mv initrd.img initrd.gz
```

```
gunzip initrd.gz
```

```
mkdir tmp
```

```
cd tmp
```

```
cpio -m -i <../initrd
```

```
zip -ry ../ramdisk-recovery.zip *
```

If your twrp ramdisk includes unusual file names it may break the build, such as [ and [[ from busybox, if your twrp includes them, then they need to be deleted before zipping the ramdisk, create the symlinks in init.recovery.rc if they're important


Integrate device doze packages into Settings
--------------------------------------------
You can integrate device-specific doze packages into Settings app using _intent-filter_ element in AndroidManifest.xml of the package:
```
<intent-filter>
    <action android:name="com.aicp.settings.device.DOZE_SETTINGS" />
    <category android:name="android.intent.category.DEFAULT" />
</intent-filter>
```
as [here](https://github.com/AICP/device_oneplus_sdm845-common/blob/16f5876fdaf72be3a66e2b84ac4c6fff185c572e/doze/AndroidManifest.xml#L52-L55)


Compile Kernel against a custom AOSP clang version
-----------------------------------------------
to compile your kernel against a custom Clang version, add these to your BoardConfig.mk file
```
TARGET_KERNEL_CLANG_CUSTOM := true
TARGET_KERNEL_CLANG_VERSION := latest
```
which will use the latest Clang version available, a specific version can be used using:
```
TARGET_KERNEL_CLANG_VERSION := r377782b
```
