#!/bin/bash
# Is obsidian on?
obs_status(){
out="true"
ox1=$(tasklist | grep -c "Obsidian.exe")
[ "$ox1" -gt 1 ] || out="false"
echo "$out"
}
while :
do
	while [ "$(obs_status)" == "true" ]
	do
		echo "logged $(date +%T)" >> obs.monitor.txt
		sleep 1
		break
	done
	while [ ! -f 'obs.pwr.md' ] && [ "$(obs_status)" == "true" ]
	do
		source obs_ren_env
		break
	done
	echo "logged $(date +%T)" >> heart.monitor.txt
	sleep 1
done
