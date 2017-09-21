#!/bin/bash
echo "=================================== Auto Install Mikrotik On Unbuntu ==================================="
echo "===================================             ./IqbalFAF           ==================================="
echo "===================================    http://iqbalfaf.blogspot.com  ==================================="
wget https://download2.mikrotik.com/routeros/6.38.3/chr-6.38.3.img.zip -O chr.img.zip  && \
gunzip -c chr.img.zip > chr.img  && \
mount -o loop,offset=33554944 chr.img /mnt && \
ADDRESS=`ip addr show eth0 | grep global | cut -d' ' -f 6 | head -n 1` && \
GATEWAY=`ip route list | grep default | cut -d' ' -f 3` && \
echo "/ip address add address=$ADDRESS interface=[/interface ethernet find where name=ether1]
/ip route add gateway=$GATEWAY
 " > /mnt/rw/autorun.scr && \
umount /mnt && \
echo u > /proc/sysrq-trigger && \
dd if=chr.img bs=1024 of=/dev/vda
echo "Silahkan Matikan VPS Anda Dan Nyalakan Kembali"
echo "User Login Mikrotik"
echo "User : Admin"
echo "Password : di kosongkan"

