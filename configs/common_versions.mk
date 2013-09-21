# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell vendor/aicp/tools/getdate)
AICP_BRANCH=jb-mr2

ifneq ($(AICP_BUILD),)
    # AICP_BUILD=<goo version int>/<build string>
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.developerid=aicp \
        ro.goo.rom=aicp \
        ro.goo.version=$(shell echo $(AICP_BUILD) | cut -d/ -f1) \
        ro.aicp.version=$(TARGET_PRODUCT)_$(AICP_BRANCH)_$(shell echo $(AICP_BUILD) | cut -d/ -f2)
else
    ifneq ($(AICP_NIGHTLY),)
        # AICP_NIGHTLY=true
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.aicp.version=$(TARGET_PRODUCT)_$(AICP_BRANCH)_nightly_$(DATE)
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.aicp.version=$(TARGET_PRODUCT)_$(AICP_BRANCH)_unofficial_$(DATE)
    endif
endif

# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
        ro.aicp.branch=$(AICP_BRANCH) \
        ro.aicp.device=$(AICP_PRODUCT)

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1
