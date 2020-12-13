# Prerequisites for device maintaining

## Application procedure

* Applicants with history of "conflicts" won't be accepted in any way. There's no need to apply for "build-bots" either. You should be aware of this before applying!
* Applicants should drop a message on our discord server (https://discord.gg/nMQUVRD). The team will then notify the reviewers and give you the appropriate contact information for your reviewer. "Spamming" the discord (and/or team members) will result in an immediate rejection.
* Applicants contacting the team to apply on any other communication platform but **Discord** will be rejected as they clearly didn't read this!
* Applicants **must** be aware of the fact that the team's language for communicating is ENGLISH.
* **Continued support** will be needed, so ask yourself: *"Can/Do I want to provide continuous support?"*. AICP is not a "submit & forget" home for buildbots. We don't want people who build numerous custom ROMs. This is not the purpose of maintaining from our point of view. You need to be willing to continue maintaining the device by fixing bugs, applying AOSP security updates and eventually improving performance.
* An application should include links to the device, vendor and kernel trees on GitHub, plus the email address of the applicant. Please be patient once you have sent your application. It takes some time to review your source code. If changes are deemed necessary, you will receive notice for improvement and be able to re-apply after improving.
* Applicants should show some respect towards the reviewer regardless of the decision. Privacy is respected by us, so the applicant is supposed to do this too.
* Applicants **must** use some common sense, mature behavior and politeness, as the team considers that too. Reviewers are not "Bro's" as they are not your family and thus the application will be rejected immediately.
* Applicants should keep in mind **not to bother** any reviewer nor the team for the final results of the application. Reviewers try to judge objectively on every application.
* Accepted applicants **must** be active and reachable on our team chat, unless they have given a reason as of why they can't.
* Accepted applicants should also keep in mind that spreading/sharing parts of team internal conversations to anyone for whatever purpose, will result in a ban from the team.


*Note: Successfully passing the application for the team also gives you the possibility of opening an "official" DevDB thread on XDA for your device using our [XDA template](https://raw.githubusercontent.com/AICP/vendor_aicp/r11.1/docs/xda_template/xda_thread-template.txt).*

---

## Maintainer

* Maintainers **must** have an GMail-account on Github and Gerrit.
* Maintainers **must** know how to use Gerrit correctly, including the abilities to push / rebase / review / cherrypick commits, the usage of proper topics for related commits or assigning reviewers.
* Maintainers **must** know how to handle Git correctly, including rebasing / merging / pulling or amending to commits as well as cloning and working with repositories.
* Maintainers **must** retain proper authorship on commits or changes including the commit history, when using "picked" commits from other sources. Authorship hereby means the **original** author should be named (commit history!). As authorship is important for us in the open source community, it is mandatory for pushing to Github or Gerrit.
* Maintainers **must** have some basic knowledge about fixing bugs and pulling logs (on device and/or via ADB).


---

## Device

* The device **must** be buildable by using open sourced dependencies that have a valid commit history.
* The device **must** have an official or at least trustable recovery (TWRP preferably) working and publicly available.
* The device **must** enforce SELinux before going official. If not possible at the moment of adding, it will stay in beta stage until SELinux can be enforced.
* The kernel **should** be upstreamed. https://github.com/android-linux-stable is a great resource (depending on the kernel version) for this, but is not required though. Kernel feature additions **must** be allowed and approved by the team before adding. *For example: Overclocking/undervolting apart from the manufacturer's default is not tolerated.* The kernel **must** not intentionally block any apps and/or magisk modules from being used unless if there is a specific case where it's needed (the team will determine this), this does not mean that you have to make sure that every app and/or module is working, it just means that you can't block them without a good reason. It is **preferred** that the kernel can be compiled with clang.
* The device's storage capabilities (internal and/or external) **must** be fully working.
* The device **must** have working audio for phone calls(!) on at least handset, speaker, headset (phone jack) and Bluetooth.
* The device **must** be able to make a data connections via SIM and/or Wifi. If the device has more than one SIM slot, both slots must be working.
* The device **must** have other features for data transfers/communication working, like Bluetooth / NFC / Wifi Hotspot or USB tethering. This is of course dependent on the device's hardware.
* The device **must** have a working camera. This includes front and rear cameras, if applicable. This means that **all** Camera supported features for Photo and Video should be supported and working.
* The device's sensors, including fingerprint / proximity / acceleration / etc., **must** be working.
* The device tree **must** not include any unused overlays, but **must** include the basic overlays to work with AICP features like e.g. key configs, pocketmode, doze etc.
* The device tree **can** include device specific overlays and packages, but not any obsolete packages or unnecessary properties (system.prop, vendor.prop, etc.).


*Note: Once you and your device have been successfully accepted, you will be given access to our team chat and limited access to our servers for your needed device repositories. Of course you will receive help on maintaining your device and have to coordinate your device with the development of AICP.*



## Do you think you still have the guts to tame the beast? - Well, then hook us up on https://discord.gg/nMQUVRD
