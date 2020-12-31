# Prerequisites for device maintaining

## Application procedure

* Applicants with a history of "conflicts" won't be accepted in any way. There's no need to apply for "build-bots" either. You should be aware of this before applying!
* Applicants should drop a message on our discord server (https://discord.gg/nMQUVRD). The team will then notify the reviewers and give you the appropriate contact information for your reviewer. "Spamming" the discord (and/or team members) will result in an immediate rejection.
* Applicants contacting the team to apply via communication platforms other than **Discord** will be rejected as they clearly didn't read this!
* Applicants **must** be aware of the fact that the team's language for communicating is ENGLISH.
* **Continuous support** will be needed, so ask yourself: *"Can/Do I want to provide continuous support?"*. AICP is not a "submit & forget" home for buildbots. We don't want people who build numerous custom ROMs. This is not the purpose of maintaining from our point of view. You need to be willing to continue maintaining the device by fixing bugs, applying AOSP security updates, and ensuring an acceptable user experience.
* An applicant must include their email address alongside links to the device, vendor, and kernel trees on Github within their application. Once an application has been submitted, please be patient as it takes time to review the suggested trees. If changes are deemed necessary, the applicant will be notified. An application may be re-submitted once appropriate changes are made.
* Applicants should be respectful of the reviewer, the reviewer's privacy, and the reviewing process. The reviewer also will uphold these values.
* Applicants **must** use common sense, acting maturely and politely. When making a final decision, our team considers the person as well as the work. Reviewers are not your "bro" and should not be treated as family or friends. The application will be rejected immediately if this is not respected.
* Applicants should keep in mind **not to bother** any reviewer nor the team for the final results of the application. Reviewers try to judge objectively on every application.
* Accepted applicants **must** be active and reachable on our team chat, unless they have given a reason as to why they can't.
* Accepted applicants should also keep in mind that spreading/sharing parts of the team's internal conversations to anyone for whatever purpose will result in a ban from the team.


*Note: Successfully passing the application for the team also gives you the possibility of opening an "official" DevDB thread on XDA for your device using our [XDA template](https://raw.githubusercontent.com/AICP/vendor_aicp/r11.1/docs/xda_template/xda_thread-template.txt).*

---

## Maintainer

* Maintainers **must** have a Gmail address on Gerrit, and Github.
* Maintainers **must** be familiar with Gerrit etiquette. Maintainers should be able to push, rebase, review, and cherrypick; they should be able to assign topics to commits and reviewers to commits and topics.
* Maintainers **must** know how to handle Git correctly, including rebasing, merging, pulling, or amending to commits as well as cloning and working with repositories.
* Maintainers **must** retain proper authorship on commits or changes including the commit history when using "picked" commits from other sources. Authorship hereby means the **original** author must be named as the author on commits in the commit history. As authorship is important for us in the open-source community, it is mandatory to have proper authorship for pushing to Github or Gerrit.
* Maintainers **must** have some basic knowledge about fixing bugs and pulling logs (on the device and/or via ADB).


---

## Device

* The device **must** be buildable by using open-sourced dependencies that have a valid commit history.
* The device **must** have an official or at least a working and publicly available recovery (TWRP preferred).
* The device **must** enforce SELinux before going official. If not possible at the moment of adding, it will stay in the beta stage until SELinux can be enforced.
* Kernel feature additions **must** be approved by the team before adding. *lowering the CPU minimum frequency beyond OEM limits is not allowed, and raising the maximum CPU frequency beyond OEM limits is not allowed, and undervolting/overvolting is generally not allowed but can be approved on a per device basis as needed*
* The device's storage capabilities (internal and/or external) **must** be fully working.
* The device **must** have working audio for phone calls(!) on at least handset, speaker, headset (phone jack), and Bluetooth.
* The device **must** be able to make data connections via SIM and/or Wi-Fi. If the device has more than one SIM slot, both slots must be working.
* The device **must** have other features for data transfers/communication working, like Bluetooth / NFC / Wifi Hotspot or USB tethering. This is of course dependent on the device's hardware.
* The device **must** have a working camera. This includes front and rear cameras, if applicable. This means that **all** Camera supported features for Photo and Video should be supported and working.
* The device's sensors, including fingerprint / proximity / acceleration / etc., **must** be working.
* The device tree **must** not include any unused overlays, but **must** include the basic overlays to work with AICP features like e.g. key configs, pocketmode, doze, etc.
* The device tree **can** include device-specific overlays and packages, but should not include any obsolete packages or unnecessary properties. Under no circumstances should the device tree include vendor copyrighted and DRM violating items in it.

*Note: Once you and your device have been successfully accepted, you will be given access to our team chat and limited access to our servers for your needed device repositories. Of course, you will receive help on maintaining your device and have to coordinate your device with the development of AICP.*



## Do you think you still have the guts to tame the beast? - Well, then hook us up on https://discord.gg/nMQUVRD
