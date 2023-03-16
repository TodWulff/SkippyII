#!/bin/bash

mkdir -p ~/temp

phrase=""
for element in "$@"
do
	phrase="$phrase $element"
done

#writes to klipper console
echo "M118 <font color=gray>Skippy: </font><font color=lime>$phrase</font>" > ~/printer_data/comms/klippy.serial

#pico2wave -l en-US -w ~/temp/temp.wav "$phrase" > /dev/null 2>&1 &
#gtts-cli "$phrase" -o ~/temp/temp.wav > ~/temp/temp_gtts.log 2>&1
gtts-cli "$phrase" -o /home/pi/temp/temp.wav > ~/temp/temp_gtts.log 2>&1


#cvlc --gain 1 --rate 1.25 --quiet --play-and-exit ~/temp/temp.wav > /dev/null 2>&1
cvlc --gain 1 --quiet --rate 1.25 --play-and-exit ~/temp/temp.wav > ~/temp/temp_cvlc.log 2>&1 

