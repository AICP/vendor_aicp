# Inherit common Aicp stuff
$(call inherit-product, vendor/aicp/config/common.mk)

# Inherit Aicp car device tree
$(call inherit-product, device/lineage/car/lineage_car.mk)
