# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT) \
    ro.bootimage.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# AICP System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.aicp.display.version=$(AICP_VERSION) \
    ro.aicp.buildtype=$(AICP_BUILDTYPE) \
    ro.aicp.version.update=$(AICP_BRANCH)-$(VERSION) \
    ro.modversion=$(AICP_VERSION) \
    ro.aicp.version=$(VERSION)-$(AICP_BUILDTYPE)

# AICP Stats
ADDITIONAL_BUILD_PROPERTIES += \
    ro.aicp.branch=$(AICP_BRANCH) \
    ro.romstats.url=https://stats.aicp-rom.com/ \
    ro.romstats.name=AICP \
    ro.romstats.buildtype=$(AICP_BUILDTYPE) \
    ro.romstats.version=$(VERSION) \
    ro.romstats.tframe=1 \
    ro.romstats.askfirst=1
