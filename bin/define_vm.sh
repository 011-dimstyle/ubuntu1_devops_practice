#! /bin/bash
# (c) 2025 smile hacking <smilehacking@gmail.com>
# define cloud vm

shopt -s globstar

MEMORY=""
while ! [[ $MEMORY =~ ^[1-9]+$ ]]; do
    read -p "memory (default 4096) : " MEMORY   
done

AMOUNT_CPU=""
while ! [[ $AMOUNT_CPU=~ ^[1-9]+$ ]]; do
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


# virt-install -c qemu:///system \
# --memory $MEMORY \
# --cpu host-model \
# --vcpus $AMOUNT_CPU \
# --cdrom $CDROM \




