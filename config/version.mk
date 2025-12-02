PRODUCT_VERSION_MAJOR = 23
PRODUCT_VERSION_MINOR = 0

ifeq ($(AICP_VERSION_APPEND_TIME_OF_DAY),true)
    AICP_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    AICP_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set AICP_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef AICP_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "AICP_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^AICP_||g')
        AICP_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(AICP_BUILDTYPE)),)
    AICP_BUILDTYPE := UNOFFICIAL
    AICP_EXTRAVERSION :=
endif

ifeq ($(AICP_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        AICP_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

AICP_VERSION_SUFFIX := $(AICP_BUILD_DATE)-$(AICP_BUILDTYPE)$(AICP_EXTRAVERSION)-$(AICP_BUILD)

# Internal version
AICP_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(AICP_VERSION_SUFFIX)

# Display version
AICP_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(AICP_VERSION_SUFFIX)

# LineageOS version properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.lineage.version=$(AICP_VERSION)-$(shell date -u +%Y%m%d)-${AICP_BUILDTYPE}-$(DEVICE_NAME) \
    ro.lineage.display.version=$(AICP_VERSION)-$(shell date -u +%Y%m%d)-${AICP_BUILDTYPE}-$(DEVICE_NAME) \
    ro.lineage.build.version=$(AICP_VERSION) \
    ro.lineage.releasetype=$(AICP_BUILDTYPE)
