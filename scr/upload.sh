#!/bin/bash

file=$1

luatool.py -b 115200 -p /dev/cu.usbserial-00001014 -f ~/work/linkgo/nodemcu-quick/scr/$1 -t $1 --verbose
