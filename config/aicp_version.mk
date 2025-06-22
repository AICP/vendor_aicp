AICP_BRANCH=v

# AICP RELEASE VERSION
AICP_VERSION_MAJOR = 20
AICP_VERSION_MINOR = 0
AICP_VERSION_MAINTENANCE = 0

PRODUCT_VERSION_MAJOR := $(AICP_VERSION_MAJOR)
PRODUCT_VERSION_MINOR := $(AICP_VERSION_MINOR)
PRODUCT_VERSION_MAINTENANCE := $(AICP_VERSION_MAINTENANCE)

VERSION := $(AICP_VERSION_MAJOR).$(AICP_VERSION_MINOR)
DEVICE_NAME := $(shell echo $(TARGET_PRODUCT) | sed -e 's|^aicp_||g')

ifndef AICP_BUILDTYPE
    ifdef RELEASE_TYPE
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^AICP_||g')
        AICP_BUILDTYPE := $(RELEASE_TYPE)
    else
        AICP_BUILDTYPE := UNOFFICIAL
    endif
endif

ifdef AICP_BUILDTYPE
    ifeq ($(AICP_BUILDTYPE), NIGHTLY)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-NIGHTLY-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILDTYPE), WEEKLY)
       AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-WEEKLY-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILDTYPE), EXPERIMENTAL)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-EXPERIMENTAL-$(shell date -u +%Y%m%d)
    endif
    ifeq ($(AICP_BUILDTYPE), UNOFFICIAL)
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%m%d)
    endif
else
#We reset back to UNOFFICIAL
        AICP_VERSION := $(TARGET_PRODUCT)_$(AICP_BRANCH)-$(VERSION)-UNOFFICIAL-$(shell date -u +%Y%m%d)
endif

# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
PRODUCT_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# AICP System Version
PRODUCT_SYSTEM_PROPERTIES += \
    ro.aicp.display.version=$(AICP_VERSION) \
    ro.aicp.buildtype=$(AICP_BUILDTYPE) \
    ro.aicp.version.update=$(AICP_BRANCH)-$(VERSION) \
    ro.modversion=$(AICP_VERSION) \
    ro.aicp.version=$(VERSION)-$(AICP_BUILDTYPE)

# additions for LOS-recovery
PRODUCT_SYSTEM_PROPERTIES += \
    ro.lineage.build.version=$(VERSION) \
    ro.lineage.display.version=$(VERSION)-$(shell date -u +%Y%m%d)-${AICP_BUILDTYPE}-$(DEVICE_NAME) \
    ro.lineage.version=$(VERSION)-$(shell date -u +%Y%m%d)-${AICP_BUILDTYPE}-$(DEVICE_NAME)

# AICP Stats
PRODUCT_SYSTEM_PROPERTIES += \
    ro.aicp.branch=$(AICP_BRANCH) \
    ro.romstats.url=https://stats.aicp-rom.com/ \
    ro.romstats.name=AICP \
    ro.romstats.buildtype=$(AICP_BUILDTYPE) \
    ro.romstats.version=$(VERSION) \
    ro.romstats.tframe=1 \
    ro.romstats.askfirst=1
