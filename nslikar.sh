device=$1
if [ "$device" = "" ]
then
device=2
fi

#echo dev=$device

pactl load-module module-loopback adjust_time=0 latency_msec=1 >> /dev/null
read -s -n 1 -p "Press key to clear"
pactl set-source-mute $device toggle
pactl set-source-mute $device toggle

echo -e "\nPress Enter to exit, arrows Up Down to ajust mic volume"

action="q"
while [ "$action" != "" ]
do
read -n 1 -s action

if [ "$action" = $'\x1b' ] 
then  
    read -sn1 -t 0.1 tmp
    if [[ "$tmp" == "[" ]] 
    then
        read -sn1 -t 0.1 tmp
#	echo "esc code $tmp"
	if [[ "$tmp" == "A" ]]
	then
	    #echo "Up"
	    pactl set-source-volume $device +5%
	fi
    
	if [[ "$tmp" == "B" ]]
	then
    	    #echo "Down"
	    pactl set-source-volume $device -- -5%
	fi
    fi
fi

done

pactl unload-module module-loopback
