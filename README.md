# JT-8183HJD
This is a Wifi Camera Jortan 

![Jortan 8183](/camera.jpg "Picture of Jortan 8183 Camera")

Investigation on progress. Firmware from SPI Memory 8Mb named XM25QH64C
 Linux version 4.4.282 (user31@EMB-202204-new-233) (gcc version 5.5.0 (Buildroot 2018.02.7_V1.0.05-g4b04ad0) ) #1 Tue Jul 11 02:49:34 UTC 2023
 The CPU of Camera is a Taishan TS100, rebrand of ANYKA CPU AK3918EV300L 
 (ID 0x535434) 
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=0005317f

Serial console can be connected from 3 pins near reset button TX, GND and RX at 115200bps. 

The board version is named JORTAN ATAQ3T1H1N JW_G2365-V3_3 from 20240401
the WIFI module is a ssv6355 from USB module
this camera uses a program named IPC from /ipc/ipc  (Gwell IPC System! gcc 5.5.0 [03:48:01 Jan 26 2024]) 

The CMOS image sensor is a SMARTSENS SSC1346 1MP	1/4,6"	2,65 μm	pixel size
after boot you can see this mounting scheme:
```
mount
/dev/root on / type squashfs (ro,relatime)
devtmpfs on /dev type devtmpfs (rw,relatime,size=18900k,nr_inodes=4725,mode=755)
proc on /proc type proc (rw,relatime)
tmpfs on /tmp type tmpfs (rw,relatime)
tmpfs on /var type tmpfs (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,mode=600,ptmxmode=000)
tmpfs on /mnt type tmpfs (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
/dev/mtdblock7 on /rom type jffs2 (rw,relatime)
tmpfs on /mnt/ramdisk type tmpfs (rw,relatime)
tmpfs on /etc type tmpfs (rw,relatime)
tmpfs on /tmp type tmpfs (rw,relatime)
/dev/mtdblock6 on /ipc type squashfs (ro,relatime)
/dev/mtdblock6 on /usr type squashfs (ro,relatime)
/dev/mmcblk0p1 on /mnt/disc1 type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=continue)
```

this is the / folder:
```
rwxr-xr-x   15 1008     1008           187 Jul  7  2023 .
drwxr-xr-x   15 1008     1008           187 Jul  7  2023 ..
drwxr-xr-x    2 1008     1008          1433 Aug 29  2023 bin
drwxr-xr-x    4 root     root          1580 Jan  1  1970 dev
drwxrwxrwt   10 root     root           540 Mar 17 14:34 etc
drwxrwxr-x   13 root     root           322 Jan 26  2024 ipc
drwxr-xr-x    3 1008     1008           696 Jan 13  2023 lib
-rwxr--r--    1 1008     1008          2772 Dec 29  2020 linuxrc
drwxrwxrwt    4 root     root            80 Jan  1  1970 mnt
dr-xr-xr-x   60 root     root             0 Jan  1  1970 proc
drwxr-xr-x    7 root     root             0 Jan  1  1970 rom
drwxr-xr-x    2 1008     1008           836 Sep 29  2021 sbin
dr-xr-xr-x   13 root     root             0 Jan  1  1970 sys
drwxr-xr-x    3 root     root           160 Mar 17 15:23 tmp
drwxrwxr-x   13 root     root           322 Jan 26  2024 usr
drwxrwxrwt    7 root     root           140 Jan  1  1970 var
```






