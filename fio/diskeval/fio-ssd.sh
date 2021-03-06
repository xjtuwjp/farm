#! /bin/bash

# evaluate the raw disk performance of LSI in srv365-09

source ./defination

if [ ! -x $Fio ]; then
        echo You need fio installed to start io evaluation
        exit 1
fi

rm -rf $Logdir
rm -rf $Taskdir

test -d $Logdir || mkdir -p $Logdir
test -d $Taskdir || mkdir -p $Taskdir
test -e $LogFile || touch $LogFile

for ioengine in $ioengines
do
	for rw in $rws
	do
		for bs in $bss
		do
			for iodepth in $iodepths
			do
# iodepth is meaningless for sync engine
if [ $ioengine = "sync" ] && [ $iodepth -gt 1 ]; then
	continue;
fi

numactl --cpunodebind=0 --preferred=0 $Fio --direct=1 --minimal --filesize=$DataSize --ioengine=$ioengine --rw=$rw --bs=$bs --iodepth=$iodepth --name=/dev/sda --thread >> $LogFile

sleep 10
			done
		done
	done
done
