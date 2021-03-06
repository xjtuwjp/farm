#! /bin/bash

source ./define.sh

# direct io
for c in $cbufsizs
do
        for s in $rcstreamnums
#        for s in 16
	do
cmd1="env RCFTPRC=$configdir/rcftprc-nondirectio-$c-$s $rcftpbin -n -i -v < $taskdir/put-10.200.200.9-bc1 >> $logdir/rcftp-nondirectio-bc1-$c-d$s.log"
cmd2="env RCFTPRC=$configdir/rcftprc-nondirectio-$c-$s $rcftpbin -n -i -v < $taskdir/put-10.200.200.10-bc2 >> $logdir/rcftp-nondirectio-bc2-$c-d$s.log"
cmd3="env RCFTPRC=$configdir/rcftprc-nondirectio-$c-$s $rcftpbin -n -i -v < $taskdir/put-10.200.200.11-bc3 >> $logdir/rcftp-nondirectio-bc3-$c-d$s.log"
cmd4="env RCFTPRC=$configdir/rcftprc-nondirectio-$c-$s $rcftpbin -n -i -v < $taskdir/put-10.200.200.12-bc4 >> $logdir/rcftp-nondirectio-bc4-$c-d$s.log"
cmd5="env RCFTPRC=$configdir/rcftprc-nondirectio-$c-$s $rcftpbin -n -i -v < $taskdir/put-10.200.200.13-bc5 >> $logdir/rcftp-nondirectio-bc5-$c-d$s.log"
cmd6="env RCFTPRC=$configdir/rcftprc-nondirectio-$c-$s $rcftpbin -n -i -v < $taskdir/put-10.200.200.14-bc6 >> $logdir/rcftp-nondirectio-bc6-$c-d$s.log"
cmd7="env RCFTPRC=$configdir/rcftprc-nondirectio-$c-$s $rcftpbin -n -i -v < $taskdir/put-10.200.200.15-bc7 >> $logdir/rcftp-nondirectio-bc7-$c-d$s.log"

echo "#! /bin/bash" > put-$cvrani09.sh
echo "#! /bin/bash" > put-$cvrani10.sh
echo "#! /bin/bash" > put-$cvrani11.sh
echo "#! /bin/bash" > put-$cvrani12.sh
echo "#! /bin/bash" > put-$cvrani13.sh
echo "#! /bin/bash" > put-$cvrani14.sh
echo "#! /bin/bash" > put-$cvrani15.sh

echo "ssh shudong@$cvrani01" \"$cmd1\" >> put-$cvrani09.sh
echo "ssh shudong@$cvrani02" \"$cmd2\" >> put-$cvrani10.sh
echo "ssh shudong@$cvrani04" \"$cmd3\" >> put-$cvrani11.sh
echo "ssh shudong@$cvrani05" \"$cmd4\" >> put-$cvrani12.sh
echo "ssh shudong@$cvrani06" \"$cmd5\" >> put-$cvrani13.sh
echo "ssh shudong@$cvrani07" \"$cmd6\" >> put-$cvrani14.sh
echo "ssh shudong@$cvrani08" \"$cmd7\" >> put-$cvrani15.sh

chmod +x put-*.sh


date "+%F %X" >> $logdir/datetime_start.log

./put-$cvrani09.sh &
pid1=$!
./put-$cvrani10.sh &
pid2=$!
./put-$cvrani11.sh &
pid3=$!
./put-$cvrani12.sh &
pid4=$!
./put-$cvrani13.sh &
pid5=$!
./put-$cvrani14.sh &
pid6=$!
./put-$cvrani15.sh &
pid7=$!

wait $pid1 $pid2 $pid3 $pid4 $pid5 $pid6 $pid7
date "+%F %X" >> $logdir/datetime_end.log

sleep 10
	done
done

