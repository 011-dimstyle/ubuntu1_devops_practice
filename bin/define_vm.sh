#! /bin/bash
# (c) 2025 smile hacking <smilehacking@gmail.com>
# define cloud vm

shopt -s globstar

OSVAR=""
LISTOS=$(osinfo-query os --fields=short-id)
echo "$LISTOS"
while true ; do
    read -r -p "chooose the os : " OSVAR
    if printf "%s\n" $LISTOS | grep -Fqx $OSVAR; then
        break
    else
        echo "OS variant not found"
    fi
done

MEMORY=""
while ! [[ $MEMORY =~ ^[1-9]+$ ]]; do
    read -p "memory (default 4096) : " MEMORY   
done

AMOUNT_CPU=""
while ! [[ $AMOUNT_CPU=~ '^[1-9]+$' ]]; do
    read -p "cpu (default 2) : " AMOUNT_CPU
done

CDROM=""
while ! [[ -f $CDROM ]]; do
    read -p "path to iso file : " CDROM 
done

DISK=""
while ! [[ -f $DISK ]]; do
    read -p "path to disk file : " DISK
done

FORMAT=raw
if qemu-img info $DISK | grep -q qcow2 ; then
    $FORMAT=qcow2
fi

sudo rsync -avhLA /usr/share/OVMF/OVMF_VARS.fd .

virt-install -c qemu:///system \
--memory $MEMORY \
--cpu host-model \
--vcpus $AMOUNT_CPU \
--cdrom $CDROM \
--disk path=$DISK,format=$FORMAT,bus=virtio,serial=linux-disk \
--boot loader=/usr/share/OVMF/OVMF_CODE.fd,loader.secure=no,loader.readonly=yes,loader_type=pflash,nvram=$(pwd)/OVMF_VARS \
--network default \
--graphics spice





