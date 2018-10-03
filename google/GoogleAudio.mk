# Copyright 2016-2017 The Pure Nexus Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := vendor/aicp/google

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/alarms/A_real_hoot.ogg:system/media/audio/alarms/A_real_hoot.ogg \
    $(LOCAL_PATH)/alarms/Bright_morning.ogg:system/media/audio/alarms/Bright_morning.ogg \
    $(LOCAL_PATH)/alarms/Cuckoo_clock.ogg:system/media/audio/alarms/Cuckoo_clock.ogg \
    $(LOCAL_PATH)/alarms/Early_twilight.ogg:system/media/audio/alarms/Early_twilight.ogg \
    $(LOCAL_PATH)/alarms/Full_of_wonder.ogg:system/media/audio/alarms/Full_of_wonder.ogg \
    $(LOCAL_PATH)/alarms/Gentle_breeze.ogg:system/media/audio/alarms/Gentle_breeze.ogg \
    $(LOCAL_PATH)/alarms/Icicles.ogg:system/media/audio/alarms/Icicles.ogg \
    $(LOCAL_PATH)/alarms/Jump_start.ogg:system/media/audio/alarms/Jump_start.ogg \
    $(LOCAL_PATH)/alarms/Loose_change.ogg:system/media/audio/alarms/Loose_change.ogg \
    $(LOCAL_PATH)/alarms/Rolling_fog.ogg:system/media/audio/alarms/Rolling_fog.ogg \
    $(LOCAL_PATH)/alarms/Spokes.ogg:system/media/audio/alarms/Spokes.ogg \
    $(LOCAL_PATH)/alarms/Sunshower.ogg:system/media/audio/alarms/Sunshower.ogg \
    $(LOCAL_PATH)/effects/audio_end.ogg:system/media/audio/ui/audio_end.ogg \
    $(LOCAL_PATH)/effects/audio_initiate.ogg:system/media/audio/ui/audio_initiate.ogg \
    $(LOCAL_PATH)/effects/camera_click.ogg:system/media/audio/ui/camera_click.ogg \
    $(LOCAL_PATH)/effects/camera_focus.ogg:system/media/audio/ui/camera_focus.ogg \
    $(LOCAL_PATH)/effects/Dock.ogg:system/media/audio/ui/Dock.ogg \
    $(LOCAL_PATH)/effects/Effect_Tick.ogg:system/media/audio/ui/Effect_Tick.ogg \
    $(LOCAL_PATH)/effects/InCallNotification.ogg:system/media/audio/ui/InCallNotification.ogg \
    $(LOCAL_PATH)/effects/KeypressDelete.ogg:system/media/audio/ui/KeypressDelete.ogg \
    $(LOCAL_PATH)/effects/KeypressInvalid.ogg:system/media/audio/ui/KeypressInvalid.ogg \
    $(LOCAL_PATH)/effects/KeypressReturn.ogg:system/media/audio/ui/KeypressReturn.ogg \
    $(LOCAL_PATH)/effects/KeypressSpacebar.ogg:system/media/audio/ui/KeypressSpacebar.ogg \
    $(LOCAL_PATH)/effects/KeypressStandard.ogg:system/media/audio/ui/KeypressStandard.ogg \
    $(LOCAL_PATH)/effects/Lock.ogg:system/media/audio/ui/Lock.ogg \
    $(LOCAL_PATH)/effects/LowBattery.ogg:system/media/audio/ui/LowBattery.ogg \
    $(LOCAL_PATH)/effects/NFCFailure.ogg:system/media/audio/ui/NFCFailure.ogg \
    $(LOCAL_PATH)/effects/NFCInitiated.ogg:system/media/audio/ui/NFCInitiated.ogg \
    $(LOCAL_PATH)/effects/NFCSuccess.ogg:system/media/audio/ui/NFCSuccess.ogg \
    $(LOCAL_PATH)/effects/NFCTransferComplete.ogg:system/media/audio/ui/NFCTransferComplete.ogg \
    $(LOCAL_PATH)/effects/NFCTransferInitiated.ogg:system/media/audio/ui/NFCTransferInitiated.ogg \
    $(LOCAL_PATH)/effects/Trusted.ogg:system/media/audio/ui/Trusted.ogg \
    $(LOCAL_PATH)/effects/Undock.ogg:system/media/audio/ui/Undock.ogg \
    $(LOCAL_PATH)/effects/Unlock.ogg:system/media/audio/ui/Unlock.ogg \
    $(LOCAL_PATH)/effects/VideoRecord.ogg:system/media/audio/ui/VideoRecord.ogg \
    $(LOCAL_PATH)/effects/VideoStop.ogg:system/media/audio/ui/VideoStop.ogg \
    $(LOCAL_PATH)/effects/WirelessChargingStarted.ogg:system/media/audio/ui/WirelessChargingStarted.ogg \
    $(LOCAL_PATH)/notifications/Beginning.ogg:system/media/audio/notifications/Beginning.ogg \
    $(LOCAL_PATH)/notifications/Coconuts.ogg:system/media/audio/notifications/Coconuts.ogg \
    $(LOCAL_PATH)/notifications/Duet.ogg:system/media/audio/notifications/Duet.ogg \
    $(LOCAL_PATH)/notifications/End_note.ogg:system/media/audio/notifications/End_note.ogg \
    $(LOCAL_PATH)/notifications/Gentle_gong.ogg:system/media/audio/notifications/Gentle_gong.ogg \
    $(LOCAL_PATH)/notifications/Mallet.ogg:system/media/audio/notifications/Mallet.ogg \
    $(LOCAL_PATH)/notifications/Orders_up.ogg:system/media/audio/notifications/Orders_up.ogg \
    $(LOCAL_PATH)/notifications/Ping.ogg:system/media/audio/notifications/Ping.ogg \
    $(LOCAL_PATH)/notifications/Pipes.ogg:system/media/audio/notifications/Pipes.ogg \
    $(LOCAL_PATH)/notifications/Popcorn.ogg:system/media/audio/notifications/Popcorn.ogg \
    $(LOCAL_PATH)/notifications/Shopkeeper.ogg:system/media/audio/notifications/Shopkeeper.ogg \
    $(LOCAL_PATH)/notifications/Sticks_and_stones.ogg:system/media/audio/notifications/Sticks_and_stones.ogg \
    $(LOCAL_PATH)/notifications/Tuneup.ogg:system/media/audio/notifications/Tuneup.ogg \
    $(LOCAL_PATH)/notifications/Tweeter.ogg:system/media/audio/notifications/Tweeter.ogg \
    $(LOCAL_PATH)/notifications/Twinkle.ogg:system/media/audio/notifications/Twinkle.ogg \
    $(LOCAL_PATH)/ringtones/Copycat.ogg:system/media/audio/ringtones/Copycat.ogg \
    $(LOCAL_PATH)/ringtones/Crackle.ogg:system/media/audio/ringtones/Crackle.ogg \
    $(LOCAL_PATH)/ringtones/Flutterby.ogg:system/media/audio/ringtones/Flutterby.ogg \
    $(LOCAL_PATH)/ringtones/Hotline.ogg:system/media/audio/ringtones/Hotline.ogg \
    $(LOCAL_PATH)/ringtones/Leaps_and_bounds.ogg:system/media/audio/ringtones/Leaps_and_bounds.ogg \
    $(LOCAL_PATH)/ringtones/Lollipop.ogg:system/media/audio/ringtones/Lollipop.ogg \
    $(LOCAL_PATH)/ringtones/Lost_and_found.ogg:system/media/audio/ringtones/Lost_and_found.ogg \
    $(LOCAL_PATH)/ringtones/Mash_up.ogg:system/media/audio/ringtones/Mash_up.ogg \
    $(LOCAL_PATH)/ringtones/Monkey_around.ogg:system/media/audio/ringtones/Monkey_around.ogg \
    $(LOCAL_PATH)/ringtones/Schools_out.ogg:system/media/audio/ringtones/Schools_out.ogg \
    $(LOCAL_PATH)/ringtones/The_big_adventure.ogg:system/media/audio/ringtones/The_big_adventure.ogg \
    $(LOCAL_PATH)/ringtones/Zen_too.ogg:system/media/audio/ringtones/Zen_too.ogg

PRODUCT_PROPERTY_OVERRIDES += \
   ro.config.ringtone=The_big_adventure.ogg \
   ro.config.notification_sound=Duet.ogg \
   ro.config.alarm_alert=Sunshower.ogg
