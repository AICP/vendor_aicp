PRODUCT_VERSION_MAJOR = 23
PRODUCT_VERSION_MINOR = 0

ifeq ($(LINEAGE_VERSION_APPEND_TIME_OF_DAY),true)
    AICP_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    AICP_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set AICP_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef AICP_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "LINEAGE_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^LINEAGE_||g')
        AICP_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(AICP_BUILDTYPE)),)
    AICP_BUILDTYPE := UNOFFICIAL
    LINEAGE_EXTRAVERSION :=
endif

ifeq ($(AICP_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        LINEAGE_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

LINEAGE_VERSION_SUFFIX := $(AICP_BUILD_DATE)-$(AICP_BUILDTYPE)$(LINEAGE_EXTRAVERSION)-$(AICP_BUILD)

# Internal version
LINEAGE_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_VERSION_SUFFIX)

# Display version
LINEAGE_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(LINEAGE_VERSION_SUFFIX)

# LineageOS version properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.lineage.version=$(LINEAGE_VERSION) \
    ro.lineage.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.lineage.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.lineage.releasetype=$(AICP_BUILDTYPE)
