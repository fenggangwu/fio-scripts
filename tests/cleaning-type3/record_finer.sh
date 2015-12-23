#!/bin/bash

if [ $# -ne 1 ]
then
    echo Usage: $0 [logfile]
    exit -1
fi

#logfile=nonseq_`date +%m.%d-%H:%M:%S`.log
logfile=$1

#i=0
ts_start=`date +%s.%N`

rm -f  $logfile

nr_non_seq=1

while [ $nr_non_seq -ne 0 ]
do
    ts_stop=`date +%s.%N`
    ts=$(awk "BEGIN {printf \"%.3f\",${ts_stop} - ${ts_start}}")
    nr_non_seq=`zbc_report_zones /dev/sdb | grep "non_seq 1" | wc -l`
    echo $ts $nr_non_seq | tee -a $logfile
    sleep 5
done

cp $logfile ~
#mv nonseq_$1_`date +%m.%d-%H:%M:%S`.log ~/
