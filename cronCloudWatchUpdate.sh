#!/bin/bash

TMP_CRON_FILE=./mycron

UPDATE_SCRIPT=update-cloudwatch-metrics.py
RUN_DIR=`pwd`
UPDATE_SCRIPT_PATH=$RUN_DIR/$UPDATE_SCRIPT

touch $TMP_CRON_FILE

#write out current crontab
crontab -l | grep -v $UPDATE_SCRIPT > $TMP_CRON_FILE

#echo new cron into cron file
echo "* * * * *  cd $RUN_DIR ; python $UPDATE_SCRIPT_PATH >/dev/null" >> $TMP_CRON_FILE

#install new cron file
crontab $TMP_CRON_FILE 

rm $TMP_CRON_FILE
