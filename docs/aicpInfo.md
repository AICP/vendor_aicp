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
