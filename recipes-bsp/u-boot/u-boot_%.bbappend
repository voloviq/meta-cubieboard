FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

DEPENDS += " bc-native dtc-native swig-native python3-native flex-native bison-native "

COMPATIBLE_MACHINE = "(sun4i)"

DEFAULT_PREFERENCE_sun4i="1"

SRC_URI += " \
           file://boot.cmd \
           "

UBOOT_ENV_SUFFIX = "scr"
UBOOT_ENV = "boot"

EXTRA_OEMAKE += ' HOSTLDSHARED="${BUILD_CC} -shared ${BUILD_LDFLAGS} ${BUILD_CFLAGS}" '

do_compile_append() {
    ${B}/tools/mkimage -C none -A arm -T script -d ${WORKDIR}/boot.cmd ${WORKDIR}/${UBOOT_ENV_BINARY}
}
