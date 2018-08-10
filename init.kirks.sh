#!/system/bin/sh


################################################################################
# helper functions to allow Android init like script

function write() {
    echo -n $2 > $1
}

function copy() {
    cat $1 > $2
}
################################################################################


LOG_FILE=/data/Tweaks.log

sleep 20

# Set Scaling Governor


GOVERNOR="interactive"
echo "interactive"  > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "interactive"  > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo "interactive"  > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo "interactive" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor

echo "interactive" >  /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "interactive"  > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo "interactive" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
echo "interactive" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor

write   /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq 300000


write  /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq
300000

# Set Min & Max Frequency
# 384000 486000 594000 702000 810000 918000 1026000 1134000 1242000 1350000 1458000 1512000 

CPU_MIN="300000"
CPU_MAX="1804000"

echo "300000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

echo "300000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq

echo "300000" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq

echo "300000" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq

echo "1804000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "1804000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo "1804000" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo "1804000" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq

echo "300000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq

echo "300000" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq

echo "300000" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq

echo "300000" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq

echo "1804000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo "1804000" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
echo "1804000" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
echo "1804000" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq


# Set IO Sheduler

SHEDULER="fiops"

echo $SHEDULER > /sys/block/mmcblk0/queue/scheduler
echo $SHEDULER > /sys/block/mmcblk1/queue/scheduler


echo "$SHEDULER Sheduler is running" | tee -a $LOG_FILE


# Set SD Cache

READ_AHEAD_KB="512"

echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/254:0/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/254:1/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/179:0/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/179:32/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/0:18/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/7:0/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/7:1/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/7:2/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/7:3/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/7:4/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/7:5/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/7:6/read_ahead_kb
echo $READ_AHEAD_KB > /sys/devices/virtual/bdi/7:7/read_ahead_kb
echo "256" > /sys/devices/virtual/bdi/default/read_ahead_kb

echo "SD Cache is set to $READ_AHEAD_KB kb" | tee -a $LOG_FILE



chmod 777 /sys/devices/system/cpu/cpufreq/policy0/interactive/target_loads

cat /dev/null > /sys/devices/system/cpu/cpufreq/policy0/interactive/above_hispeed_delay

TARGET_LOADS="80 300000:60 691200:70 806400:80 1017600:90 1190400:110 1305600:125 1382400:130 1401600:152 1440000:168"

HISPEED_DELAY="0"
TARGET_LOADS0="0"

echo $TARGET_LOADS0 > /sys/devices/system/cpu/cpufreq/policy0/interactive/target_loads

echo $HISPEED_DELAY > /sys/devices/system/cpu/cpufreq/policy0/interactive/above_hispeed_delay

echo "target loads is set to $TARGET_LOADS0" | tee -a $LOG_FILE

echo "hispeed delay tuned to $HISPEED_DELAY"  | tee -a $LOG_FILE

#echo "$GOVERNOR Governor is Tweaked" | tee -a $LOG_FILE;


# Custom Kernel Tweaks

# reduce / increase [mv] for all Frequencys
# echo "-90000" > /sys/devices/system/cpu/cpufreq/vdd_table/vdd_levels

# Set GPU Governor
# echo "simple" > /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/pwrscale/trustzone/governor

# Set GPU Clock
# echo "325000000" > /sys/devices/platform/kgsl-3d0.0/kgsl/kgsl-3d0/max_gpuclk

#SET gpu  min and max frequency
echo "160000000" > /sys/devices/soc/5000000.qcom,kgsl-3d0/devfreq/5000000.qcom,kgsl-3d0/min_freq

echo "430000000" > /sys/devices/soc/5000000.qcom,kgsl-3d0/devfreq/5000000.qcom,kgsl-3d0/max_freq

#KCAL settings
echo "256 256 232" >  sys/devices/platform/kcal_ctrl.0/kcal

#Fsync 
 
echo "N" >  /sys/module/sync/parameters/fsync_enabled

#Vibration intensity level

echo "1150" > /sys/class/timed_output/vibrator/vtg_level

# Swap / Tap 2 Wake
# echo "0" > /sys/android_touch/doubletap2wake
# echo "0" > /sys/android_touch/sweep2wake

# echo "Custom Kernel Settings are applied" | tee -a $LOG_FILE;
echo " " | tee -a $LOG_FILE
echo "@ $( date +"%m-%d-%Y %H:%M:%S" )" | tee -a $LOG_FILE;
echo " " | tee -a $LOG_FILE

#Configuring custom.brightness

value="$( cat /sys/devices/soc/c900000.qcom,mdss_mdp/c900000.qcom,mdss_mdp:qcom,mdss_fb_primary/leds/lcd-backlight/max_brightness)"

if (( getprop | grep -o "Miui" ) &&  ( "$value"  ! = "4095")) ; then

echo "4095" > /sys/devices/soc/c900000.qcom,mdss_mdp/c900000.qcom,mdss_mdp:qcom,mdss_fb_primary/leds/lcd-backlight/max_brightness
echo "New brightness configured"
else
echo " Brightness unchanged"
fi
echo "$value"
