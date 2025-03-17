#!/bin/sh

i=1 
while [ $i -le 6 ]
do 
    if  [ -b /dev/mmcblk0p1 ]; then
        break
    fi
    let i++
    sleep 1
done

if [ -b /dev/mmcblk0p1 ]; then
    echo "Detected TF Card"
    cd /
    mount /dev/mmcblk0p1 /mnt/disc1
    if [ $? -eq 0 ]; then
        echo "mount sdcard ok"
        if [ "$1" != "only_firmware" ] && [ -f /mnt/disc1/gwell_config/custom_setting.ini ]; then
            echo "Detected custom_setting.ini"
            cp /mnt/disc1/gwell_config/custom_setting.ini /rom/device.config
        fi 

        if [ -f /mnt/disc1/upg.bin.enc ]; then
            echo "Detected /mnt/disc1/upg.bin.enc"
            NEWFirmwareMD5="`md5sum /mnt/disc1/upg.bin.enc`"
            NEWFirmwareMD5=${NEWFirmwareMD5:0:32}
            ln -s /mnt/disc1/upg.bin.enc /tmp/upg.bin.enc
            gwellupdater.sh /tmp/upg.bin.enc
            if [ $? -eq 0 ]; then
                echo "$NEWFirmwareMD5" > /rom/DevFirmwareMD5.txt
                rm -f /tmp/*
                umount /mnt/disc1/
                exit 100
            fi
        fi
        umount /mnt/disc1/
    fi
fi

exit