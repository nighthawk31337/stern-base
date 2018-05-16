#!/bin/bash

mount -o remount,rw /

cd /usr/local/spike/
rm -f netbridge.hex
rm -f netbridge-1_0_0.hex
rm -f netbridge-1_0_1.hex
rm -f netbridge-1_0_2.hex
ln -s netbridge-1_0_3.hex netbridge.hex

rm -f display.hex
rm -f dotmatrix-0_1_10.hex
rm -f dotmatrix-0_1_11.hex
ln -s dotmatrix-0_1_12.hex display.hex

if [ ! -e "/dev/ttyUSB0" ]; then
	mknod /dev/ttyUSB0 c 188 0
	sync
fi

mount -o remount,ro /

sync

