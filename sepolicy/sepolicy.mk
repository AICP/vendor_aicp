BOARD_SEPOLICY_DIRS += \
    vendor/aokp/sepolicy

BOARD_SEPOLICY_UNION += \
    file.te \
    file_contexts \
    fs_use \
    genfs_contexts \
    installd.te \
    seapp_contexts \
    vold.te \
    mac_permissions.xml
