# Default to (primary) SD
rootdev=mmcblk0p2
if itest.b *0x28 == 0x02 ; then
	# U-Boot loaded from eMMC or secondary SD so use it for rootfs too
	echo "U-boot loaded from eMMC or secondary SD"
	rootdev=mmcblk1p2
fi
setenv bootargs console=${console} console=tty1 root=/dev/nfs rw ip=192.168.0.70 nfsroot=192.168.0.34:/home/mw/nfs/bbb-nfs,v3,tcp
tftp $kernel_addr_r zImage
tftp $fdt_addr_r sun4i-a10-cubieboard.dtb
bootz ${kernel_addr_r} - ${fdt_addr_r} || bootm ${kernel_addr_r} - ${fdt_addr_r}