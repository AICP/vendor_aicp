# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell vendor/aicp/tools/getdate)
AICP_BRANCH=kitkat

# AICP RELEASE VERSION
AICP_VERSION_MAJOR = 6
AICP_VERSION_MINOR = 0
AICP_VERSION_MAINTENANCE =

VERSION := $(AICP_VERSION_MAJOR).$(AICP_VERSION_MINOR)$(AICP_VERSION_MAINTENANCE)

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
       AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-RELEASE-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILD), NIGHTLY)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-NIGHTLY-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILD), EXPERIMENTAL)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-EXPERIMENTAL-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILD), UNOFFICIAL)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%m%d)
    endif
else
#We reset back to UNOFFICIAL
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%m%d)
endif



PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(AICP_VERSION) \
    ro.aicp.version=$(VERSION)-$(AICP_BUILD)

# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.aicp.branch=$(AICP_BRANCH) \
    ro.aicp.device=$(AICP_PRODUCT) \
    ro.romstats.url=http://stats.aicp-rom.com/ \
    ro.romstats.name=AICP \
    ro.romstats.version=$(VERSION)-$(AICP_BUILD) \
    ro.romstats.tframe=1 \
    ro.romstats.askfirst=1 \
    ro.romstats.ga=UA-48128535-2

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1
