# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell vendor/aicp/tools/getdate)
AICP_BRANCH=kitkat

# AICP RELEASE VERSION
AICP_VERSION_MAJOR = 2
AICP_VERSION_MINOR = 5
AICP_VERSION_MAINTENANCE =

ifndef AICP_BUILD
    ifdef RELEASE_TYPE
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^AICP_||g')
        AICP_BUILD := $(RELEASE_TYPE)
    else
        AICP_BUILD := UNOFFICIAL
    endif
endif

ifdef AICP_BUILD
    ifeq ($(AICP_BUILD), RELEASE)
       VERSION := $(AICP_VERSION_MAJOR).$(AICP_VERSION_MINOR)$(AICP_VERSION_MAINTENANCE)
       AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)_V$(VERSION)_RELEASE_$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILD), NIGHTLY)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)_NIGHTLY_$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILD), EXPERIMENTAL)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)_EXPERIMENTAL_$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILD), UNOFFICIAL)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)_UNOFFICIAL_$(shell date -u +%Y%m%d)
    endif
else
#We reset back to UNOFFICIAL
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)_UNOFFICIAL_$(shell date -u +%Y%m%d)
endif



PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(AICP_VERSION) \
    ro.aicp.version=$(AICP_VERSION)

# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
        ro.aicp.branch=$(AICP_BRANCH) \
        ro.aicp.device=$(TARGET_PRODUCT)

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1
