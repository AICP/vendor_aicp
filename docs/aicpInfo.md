Optional AICP (and general) overlays to add
-------------------------------
To enable the swipe up gesture:
```
<bool name="config_swipe_up_gesture_setting_available">true</bool>
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
