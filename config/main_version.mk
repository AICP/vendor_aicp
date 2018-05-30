# AICP System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.modversion=$(AICP_VERSION) \
    ro.aicp.version=$(VERSION)-$(AICP_BUILDTYPE) \
    ro.aicp.version.update=$(AICP_BRANCH)-$(VERSION)

# AICP Statistics
ADDITIONAL_BUILD_PROPERTIES += \
    ro.aicp.branch=$(AICP_BRANCH) \
    ro.romstats.url=http://stats.aicp-rom.com/ \
    ro.romstats.name=AICP \
    ro.romstats.buildtype=$(AICP_BUILDTYPE) \
    ro.romstats.version=$(VERSION) \
    ro.romstats.tframe=1 \
    ro.romstats.askfirst=1 \
    ro.romstats.ga=UA-48128535-2

# LineageOS Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)
