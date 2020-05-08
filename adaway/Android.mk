TARGET_GENERATED_HOSTS_BLOCKER := $(TARGET_OUT_INTERMEDIATES)/ADBLOCK/hosts.aicp_adblock
$(TARGET_GENERATED_HOSTS_BLOCKER): INTERMEDIATES := $(TARGET_OUT_INTERMEDIATES)/ADBLOCK
$(TARGET_GENERATED_HOSTS_BLOCKER): vendor/aicp/adaway/generate.sh vendor/aicp/adaway/generate.py external/hosts/hosts
	vendor/aicp/adaway/generate.sh $@

include $(CLEAR_VARS)
LOCAL_MODULE := hosts.aicp_adblock
LOCAL_MODULE_CLASS := ETC

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(TARGET_GENERATED_HOSTS_BLOCKER)
	@cp $< $@
