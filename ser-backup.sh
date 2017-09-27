#!/bin/sh
#A backup script to backup the server HDD to the mounted backup drive. 
#This program will be called via a cron job every week. 

#CRON 
#
#0 0 * * 7 ~/scripts/pibackup.sh 
#this will execute at midnight on sunday of each week

#MAIN PROGRAM

#echo to log file that the backup started.
echo "Backing up of SERVER01 started at " `date` >> /home/jim/log.txt
#command to back up to the backup server
# DO NOT ENCLUDE Redundancy_Drive_01 AND MEDIA DRIVE, MEDIA DRIVE WILL BACK UP DIRECTLY TO Redundancy_Drive_01
#DO NOT INCLUDE MEDIA DIRS. THIS WILL BE DONE WITH THE REDUNDANCY BACKUP SCRIPT

#comand options 	excludes 	save point	location to save
#rsync -avzP --log-file=$HOME/.rsyncd.log --delete --exclude= excludes.txt  / /mnt/backup-drive/server01
sudo rsync -avzP --delete --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/tmp --exclude=/run --exclude=/mnt --exclude=/media --exclude=/lost+found / /mnt/backup-drive/server01

#rsync -avzP -delete --exclude='/mnt' / /mnt/backup-drive/server01

#echo to the log file that the backup was completed
echo "Back up of SERVER01 complete at "  `date` >> /home/jim/log.txt

