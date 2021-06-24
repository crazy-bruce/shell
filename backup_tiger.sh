#!/usr/bin/env bash
# Author: Bruce Chen
# Create Time: 2021.06.18
# E-mail: BYchen@sonicwall.com
# Version: 1.0
# description: backup data and delete expired data



# variables
backup_dir="/home/bruce/tiger"
backup_save_dir="/home/bruce/backup_tiger"
backup_filename="tiger-`date +%F`.tar.gz"


# functions

backup_files() {

if ! (tar -zcvf $backup_save_dir/$backup_filename $backup_dir &> /dev/null);then
	echo "ERROR: backup files failed!"
	exit 1
fi	
}

delete_expired() {

num=`ls -l $backup_save_dir | grep -E "*tiger*" | wc -l`

if [ $num -gt 4 ];then
	echo "cdpQa123" | sudo -S rm -rf $backup_save_dir/`ls -l $backup_save_dir | grep -E "*tiger*" | head -n 1 | awk '{print $NF}' | xargs`
	echo -e "\033[32m The backup successful \033[0m"
fi
}



backup_files
delete_expired
echo "`date '+%Y-%m-%d %H:%M:%S'` Daily Cron Job: backup tiger successfully" >> /home/bruce/backup_tiger/backup_log.txt
