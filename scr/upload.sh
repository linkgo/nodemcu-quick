#!/bin/bash

file=$1

luatool.py -b 115200 -p /dev/cu.linvor-DevB -f $1 -t $1 --verbose
#luatool.py -b 115200 -p /dev/cu.usbserial-00001014 -f $1 -t $1 --verbose
