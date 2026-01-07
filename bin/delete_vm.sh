read -p "input the vm name : " $VMNAME

virsh -c qemu:///system undefine $VMNAME --nvram