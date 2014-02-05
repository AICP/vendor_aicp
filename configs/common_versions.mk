# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell vendor/aicp/tools/getdate)
AICP_BRANCH=kitkat

#ifneq ($(AICP_BUILD),)
#    # AICP_BUILD=<goo version int>/<build string>
#    PRODUCT_PROPERTY_OVERRIDES += \
#        ro.goo.developerid=aicp \
#        ro.goo.rom=aicp \
#        ro.goo.version=$(shell echo $(AICP_BUILD) | cut -d/ -f1) \
#        ro.aicp.version=$(TARGET_PRODUCT)_$(AICP_BRANCH)_$(shell echo $(AICP_BUILD) | cut -d/ -f2)
#else
#    ifneq ($(AICP_NIGHTLY),)
#        # AICP_NIGHTLY=true
#        PRODUCT_PROPERTY_OVERRIDES += \
#            ro.aicp.version=$(TARGET_PRODUCT)_$(AICP_BRANCH)_nightly_$(DATE)
#    else
#        PRODUCT_PROPERTY_OVERRIDES += \
#            ro.aicp.version=$(TARGET_PRODUCT)_$(AICP_BRANCH)_unofficial_$(DATE)
#    endif
#endif

# AICP RELEASE VERSION
AICP_VERSION_MAJOR = 2
AICP_VERSION_MINOR = 0
AICP_VERSION_MAINTENANCE =


VERSION := $(AICP_VERSION_MAJOR).$(AICP_VERSION_MINOR)$(AICP_VERSION_MAINTENANCE)

ifeq ($(DEVELOPER_VERSION),true)
    AICP_VERSION := dev_$(BOARD)-$(VERSION)-$(shell date -u +%Y%m%d)
else
    AICP_VERSION := $(TARGET_PRODUCT)-$(AICP_BRANCH)-V$(VERSION)-$(shell date -u +%Y%m%d)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(AICP_VERSION) \
    ro.aicp.version=$(VERSION)

# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
        ro.aicp.branch=$(AICP_BRANCH) \
        ro.aicp.device=$(TARGET_PRODUCT)

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1
