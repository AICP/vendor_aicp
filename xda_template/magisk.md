Troubleshooting Magisk (generally):
--------------------------------------------------------

1. If you're spontaneously losing root/weird magisk stuff happening:

This often happens when magisk hide is enabled.
You will either need to:
- Disable magisk hide
- Disable magisk busybox
- Or go to battery optimization settings and disable battery optimization for magisk manager

(Thx to Shadowghost for these nice descriptions that were actually for his Arise4Magisk script troubleshooting.
Please do not enable this script on AICP...)

2. Loosing root randomly!

   In some custom roms (known: LineageOS), enabling
    the Magisk busybox will make root unstable
    If you experience root loss issue, disable busybox
    in MagiskManager.

3. SafetyNet fails after enabling MagiskHide

    Magisk can only hide Magisk core features, for Magisk
    modules it depends on what the module does.
    If your ROM itself is not able to pass SafetyNet, then
    there is nothing Magisk can help.

4. Other currently known issues:

- Magisk Manager CANNOT be placed in adoptable
  storage, or superuser will not work
- MagiskSU does not support multiuser