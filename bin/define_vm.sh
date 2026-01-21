#! /usr/bin/env bash
# (c) 2025 smile hacking <smilehacking@gmail.com>
# define cloud vm

cd $(dirname "${BASH_SOURCE[0]}")/..

function help(){
    echo "OPTIONS"
    echo "-n | --name <vm name>"
    echo "-m | --memory <memory size>"
    echo "-vc | --vcpus <amount of vcpus>"
    echo "-cd | --cdrom <cdrom path>"
    echo "-d | --disk <disk path>"
}



if [[ $# -lt 10 ]]; then
    help
    exit 1 
fi

while [[ $# -gt 0 ]]; do 
    case $1 in
        -n|--name)
            NAME=$2
            shift 2
            ;;
        -m|--memory)
            MEMORY=$2
            shift 2
            ;;
        -vc|--vcpus)
            AMOUNT_CPU=$2
            shift 2
            ;;
        -cd|--cdrom)
            CDROM=$2
            shift 2
            ;;
        -d|--disk)
            DISK=$2
            shift 2
            ;;
        *)
            echo unknown option : $1
            help
            exit 1
            ;;

    esac
done

! [[ -f OVMF_VARS.fd ]] && sudo rsync -avhLA /usr/share/OVMF/OVMF_VARS.fd .
xorriso -as mkisofs -o ./seed.iso -J -R -V CIDATA ./seed/
 
virt-install -c qemu:///system \
--name $NAME
--memory $MEMORY \
--cpu host-model \
--vcpus $AMOUNT_CPU \
--cdrom $CDROM \
--disk path=./seed.iso,format=raw,bus=virtio \
--disk path=$DISK,format=$(echo $DISK | grep -q qcow2 && echo qcow2 || echo raw),bus=virtio,serial=linux-disk \
--boot loader=/usr/share/OVMF/OVMF_CODE.fd,loader.secure=no,loader.readonly=yes,loader_type=pflash,nvram=$(pwd)/OVMF_VARS.fd \
--network default \
--graphics spice





