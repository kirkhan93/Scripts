# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Kirks-Kernel V1.8 kirkirehani93 @ xda_developers
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=whyred
device.name2=whyred-user
device.name3=Redmi Note 5 Pro
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
initd=/system/etc/init.d/;
patch=/tmp/anykernel/patch;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;


# begin ramdisk changes

#Init.d
#mount -o rw,remount -t auto /system
#cp -fp  $patch/init.d/kirks $initd
#echo $patch
#chmod -R 755 $initd
#ui_print "init.d script.copying successfull"
#ui_print " "


#Remove old kernel stuffs from ramdisk

ui_print "Remove old kernel stuffs from ramdisk"

#rm -rf $ramdisk/init.kirks.rc
#rm -rf $ramdisk/init.spectrum.rc
#rm -rf $ramdisk/init.spectrum.sh
#rm -rf $ramdisk/init.kirks.sh
#remove_line init.rc "import /init.kirks.rc"
# remove_line init.rc "import /init.spectrum.rc"

rm -rf $ramdisk/init.special_power.sh
rm -rf $ramdisk/init.noname.rc
remove_line init.rc "import /init.noname.rc"
 
# init.rc
backup_file init.rc;
replace_string init.rc "cpuctl cpu,timer_slack" "mount cgroup none /dev/cpuctl cpu" "mount cgroup none /dev/cpuctl cpu,timer_slack";
append_file init.rc "run-parts" init;

insert_line init.rc "init.kirks.rc" after "import /init.usb.rc" "import /init.kirks.rc";
insert_line init.rc "init.spectrum.rc" after "import /init.kirks.rc" "import /init.spectrum.rc";


# end ramdisk changes

write_boot;

## end install




