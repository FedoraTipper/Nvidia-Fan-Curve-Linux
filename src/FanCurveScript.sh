#!/bin/bash
#Make sure to enable nvidia-xconfig --cool-bits=4
nvidia-settings -a "GPUFanControlState=1"

while true
do

gputemp=`nvidia-settings -q GPUCoreTemp |awk -F ":" 'NR==2{print $3}' |sed 's/[^0-9]*//g'`

case "${gputemp}" in
        0[0-9])
                newfanspeed="0"
                ;;
        1[0-9])
                newfanspeed="0"
                ;;
        2[0-9])
                newfanspeed="0"
                ;;
        3[0-9])
                newfanspeed="0"
                ;;
        4[0-9])
                newfanspeed="0"
                ;;
        5[0-4])
                newfanspeed="0"
                ;;
        5[5-6])
                newfanspeed="5"
                ;;
        5[7-9])
                newfanspeed="20"
                ;;
        6[0-5])
                newfanspeed="35"
                ;;
        6[6-9])
                newfanspeed="45"
                ;;
        7[0-5])
                newfanspeed="60"
                ;;
        7[6-9])
                newfanspeed="70"
                ;;
        *)
                newfanspeed="100"
                ;;
esac

nvidia-settings -a "GPUCurrentFanSpeed=${newfanspeed}" 2>&1 >/dev/null

sleep 1s

done


