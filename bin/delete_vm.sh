#! /usr/bin/env bash
# (c) 2025 smile hacking <smilehacking@gmail.com>
# delete cloud vm

 cd $(dirname "${BASH_SOURCE[0]}")/..

function help(){
    echo "OPTIONS"
    echo "-n | --name <vm name>"
}

 if [[ $# -lt 2 ]]; then
    help
    exit 1 
fi

while [[ $# -gt 0 ]]; do 
    case $1 in
        -n|--name)
            NAME=$2
            shift 2
            ;;
        *)
            echo unknown option : $1
            help
            exit 1
            ;;

    esac
done


virsh -c qemu:///system undefine $NAME --nvram --remove-all-storage
rm ./seed.iso