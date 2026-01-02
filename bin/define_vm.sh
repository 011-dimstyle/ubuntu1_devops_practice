#! /bin/bash
# (c) 2025 smile hacking <smilehacking@gmail.com>
# define cloud vm

SHORT=h,v;
LONG=help,version;

OPTS=$(getopt -o v --long verbose,env: -- "$@")
echo $OPTS