#!/bin/sh
#A backup script to make a Redundancy of my backups. 
#This program will be called via a cron job every week. 

#CRON 
#
#0 0 * * 7 ~/scripts/pibackup.sh 
#this will execute at midnight on sunday of each week

#MAIN PROGRAM

#echo to log file that the backup started.
echo "Redundancy backup started at " `date` >> /home/jim/log.txt
#command to back up to the backup server
sudo rsync -avzP -delete  /mnt/backup-drive/ /mnt/redundancy-drive/backups
#$ zip /ZippedFiles/archive.zip /Directory1/ && rsync -av --delete /ZippedFiles/ /Directory2/

#echo to the log file that the backup was completed
echo "Redundancy backup complete at "  `date` >> /home/jim/log.txt


