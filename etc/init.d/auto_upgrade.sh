#!/bin/sh

if [ -b /dev/mmcblk0p1 ]; then
    echo "Detected TF Card"
    cd /
    mount /dev/mmcblk0p1 /mnt/disc1

    if [ $? -eq 0 ]; then
        echo "mount sdcard ok"
        # auto upgrade device config.
        if [ -f /mnt/disc1/AutoUpgrade/custom_setting.ini ]; then
            echo "Detected custom_setting.ini for auto upgrade"
            NEWConfig=/mnt/disc1/AutoUpgrade/custom_setting.ini
            NEWConfigMD5=`md5sum $NEWConfig`
            NEWConfigMD5=${NEWConfigMD5:0:32}
            echo "NEWConfigMD5:$NEWConfigMD5"
            OLDConfig=/rom/device.config
            OLDConfigMD5=`md5sum $OLDConfig`
            OLDConfigMD5=${OLDConfigMD5:0:32}
            echo "OLDConfigMD5:$OLDConfigMD5"
            if [ X$NEWConfigMD5 != X$OLDConfigMD5 ]; then
                echo "NEWConfigMD5 != OLDConfigMD5"
                cp /mnt/disc1/AutoUpgrade/custom_setting.ini /rom/device.config
            else
                echo "NEWConfigMD5 == OLDConfigMD5"
            fi
            echo "auto upgrade device config done."
        fi
        # auto upgrade firmware.
        if [ -f /mnt/disc1/AutoUpgrade/auto_upg.bin.enc ]; then  
            echo "Detected /mnt/disc1/AutoUpgrade/auto_upg.bin.enc"
            if [ -f /rom/DevFirmwareMD5.txt ]; then
                OLDFirmwareMD5=`cat /rom/DevFirmwareMD5.txt`
            else
                OLDFirmwareMD5=""
            fi
            NEWFirmwareMD5="`md5sum /mnt/disc1/AutoUpgrade/auto_upg.bin.enc`"
            NEWFirmwareMD5=${NEWFirmwareMD5:0:32}
            echo "rc.local-OLDFirmwareMD5: $OLDFirmwareMD5"
            echo "rc.local-NEWFirmwareMD5: $NEWFirmwareMD5"
            if [ "$OLDFirmwareMD5" != "$NEWFirmwareMD5" ];then
                ln -s /mnt/disc1/AutoUpgrade/auto_upg.bin.enc /tmp/auto_upg.bin.enc
                gwellupdater.sh /tmp/auto_upg.bin.enc
                if [ $? -eq 0 ]; then
                    echo "$NEWFirmwareMD5" > /rom/DevFirmwareMD5.txt
                echo "auto upgrade firmware done."
                rm -f /tmp/*
                umount /mnt/disc1/
                exit 100
                fi
            else
                echo "same firmware, skip auto upgrade firmware."
            fi
            rm -f /tmp/*
        fi
    fi
    umount /mnt/disc1/
fi

exit