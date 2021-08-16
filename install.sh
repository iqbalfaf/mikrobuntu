#!/bin/bash
function normal () {
wget https://download.mikrotik.com/routeros/6.48.3/chr-6.48.3.img.zip -O chr.img.zip  && \
gunzip -c chr.img.zip > chr.img  && \
mount -o loop,offset=512 chr.img /mnt && \
ADDRESS=`ip addr show eth0 | grep global | cut -d' ' -f 6 | head -n 1` && \
GATEWAY=`ip route list | grep default | cut -d' ' -f 3` && \
echo "/ip address add address=$ADDRESS interface=[/interface ethernet find where name=ether1]
/ip route add gateway=$GATEWAY
 " > /mnt/rw/autorun.scr && \
umount /mnt && \
echo u > /proc/sysrq-trigger && \
dd if=chr.img bs=1024 of=/dev/vda
echo "============================"
echo "=== Instalation Complete ==="
echo "============================"
echo "=== Detail Login ==="
echo "Host : IPVPS"
echo "Username : admin"
echo "Password : blank (empty)"
echo "============================"
echo " VPS Going to reboot on 5 sec "
echo "============================"
sleep 5
echo b > /proc/sysrq-trigger
}

function aws () 
{
wget https://download.mikrotik.com/routeros/6.48.3/chr-6.48.3.img.zip -O chr.img.zip  && \
gunzip -c chr.img.zip > chr.img  && \
mount -o loop,offset=512 chr.img /mnt && \
ADDRESS=`ip addr show eth0 | grep global | cut -d' ' -f 6 | head -n 1` && \
GATEWAY=`ip route list | grep default | cut -d' ' -f 3` && \
echo "/ip address add address=$ADDRESS interface=[/interface ethernet find where name=ether1]
/ip route add gateway=$GATEWAY
 " > /mnt/rw/autorun.scr && \
umount /mnt && \
echo u > /proc/sysrq-trigger && \
dd if=chr.img bs=1024 of=/dev/xvda
echo "============================"
echo "=== Instalation Complete ==="
echo "============================"
echo "=== Detail Login ==="
echo "Host : IPVPS"
echo "Username : admin"
echo "Password : blank (empty)"
echo "============================"
echo " VPS Going to reboot on 5 sec "
echo "============================"
sleep 5
echo b > /proc/sysrq-trigger
}

function menu () {
    echo "============================================"
echo "Auto Installer Mikrotik CHR ON Ubuntu 16.04 "
echo "============================================"
echo "= Script Created : ="
echo "=================="
echo "==== Iqbalfaf ===="
echo "=================="
echo ""
echo "= Menu : ="
echo "========================================"
echo "(1). VPS KVM Digital Ocean,Vultr,Other"
echo "(2). VPS LightSail Aws"
echo "(0). Exit"
echo "========================================="
read -p " Input Number : " milih

if test $milih == '1'
then
normal
elif test $milih == '2'
then
aws
elif test $milih == '0'
then
sleep 3
clear
echo " thank u for using this script "
else
echo "Wrong Number... try again"
sleep 2
clear
menu
fi
}

echo "============================================"
echo "Auto Installer Mikrotik CHR ON Ubuntu 16.04 "
echo "============================================"
echo "= Script Created : ="
echo "=================="
echo "==== Iqbalfaf ===="
echo "=================="
echo ""
echo "= Menu : ="
echo "========================================"
echo "(1). VPS KVM Digital Ocean,Vultr,Other"
echo "(2). VPS LightSail Aws"
echo "(0). Exit"
echo "========================================="
read -p " Input Number : " milih

if test $milih == '1'
then
normal
elif test $milih == '2'
then
aws
elif test $milih == '0'
then
sleep 3
clear
echo " thank u for using this script "
else
echo "Wrong Number... try again"
sleep 2
clear
menu
fi
