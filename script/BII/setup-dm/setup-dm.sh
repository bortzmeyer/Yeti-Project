#!/bin/sh

# load functions
workdir=`dirname $0`
if [ -s $workdir/setup-dm-functions.sh ];then
	 . $workdir/setup-dm-functions.sh 
else
	echo "`$datetime` setup-dm-functions.sh is't exsit" >> $logfile
    exit 1
fi

refresh_git_repository

root_zone_download
check_root_zone

generate_root_ns_file
generate_root_zone

get_latest_dnskey
sign_root_zone

reload_root_zone
