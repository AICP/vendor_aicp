#!/sbin/sh

sed -i '/deep_buffer {/,/}/s/^/#/' /system/etc/audio_policy.conf
