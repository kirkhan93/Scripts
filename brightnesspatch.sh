 if (( getprop | grep -o "Miui" )) ||  (( getprop | grep -o "Masik" )) 
then
echo "4095" > /sys/devices/soc/c900000.qcom,mdss_mdp/c900000.qcom,mdss_mdp:qcom,mdss_fb_primary/leds/lcd-backlight/max_brightness
echo "New brightness configured"
else 
echo " Brightness unchanged"
fi
echo "Brightness changed to 4095 " | tee -a $LOG_FILE
echo " " | tee -a $LOG_FILE
echo "@ $( date +"%m-%d-%Y %H:%M:%S" )" | tee -a $LOG_FILE;
echo " " | tee -a $LOG_FILE
