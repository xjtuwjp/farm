#! /bin/sh

source ./defination

test -e $Parsedir || mkdir -p $Parsedir

# bandwidth

for ps in $pss
do
	for bs in $bss
	do

for cpunode in $cpunodes
do
	for memnode in $memnodes
	do

# example output
# [  4]  0.0-60.0 sec  63.3 GBytes  9.06 Gbits/sec
tail -1 $Logdir/iperf-c$cpunode-m$memnode-$bs-$ps.log | cut -c 35-39 >> $Parsedir/iperf-$bs-$ps.log

	done
done

	done
done


