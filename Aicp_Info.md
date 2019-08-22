Optional AICP (and general) overlays to add
-------------------------------
To allow the volume panel to be moved to the left/right (Option will appear in Aicp Extras):
```
<bool name="config_audioPanelOnLeftSide">true</bool>
```

To enable LiveDisplay:
```
<bool name="config_liveDisplayAvailable">true</bool>
```

To enable status bar burn in protection (AmoLED displays only!):
```
<bool name="config_statusBarBurnInProtection">true</bool>
```

To enable smart pixels (AmoLED displays only!):
```
<bool name="config_enableSmartPixels">true</bool>
```

To enable the custom swipe up gesture:
```
<bool name="config_custom_swipe_up_gesture_setting_available">true</bool>
```

To set up the hardware keys:

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

To set up the hardware keys that can be used to wake up the device:

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

To enable pocket judge (if your device supports it, you may need to adjust the path):
```
<string name="config_pocketBridgeSysfsInpocket">/sys/kernel/pocket_judge/inpocket</string>
```

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


Optional AICP packages to add (in device.mk)
-------------------------------

To build our fork of the Lineage Snap camera:
```
PRODUCT_PACKAGES += \
    Snap
```

To build our fork of the SnapDragon camera from CAF:
```
PRODUCT_PACKAGES += \
    SnapdragonCamera
```

To include JamesDSP instead of MusicFX:

Note:

>This will not work on devices that use the stock vendor image

>You will also have to add the audio effect

>Pick this if you have audio_effects.xml: https://gerrit.aicp-rom.com/c/AICP/device_htc_hima-common/+/79367

>Pick this if you have audio_effects.conf: https://gerrit.aicp-rom.com/c/AICP/device_oneplus_msm8998-common/+/79640
```
PRODUCT_PACKAGES += \
    JamesDSPManager \
    libjamesDSPImpulseToolbox
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