#!/bin/bash


servers=`ls -1 /etc/rsnapshot.conf.d/enabled/`
cd /etc/rsnapshot.conf.d/enabled/

for srv in $servers; do
 logger "start $srv backup" &&
 /usr/bin/rsnapshot -c $srv beta;
done 
