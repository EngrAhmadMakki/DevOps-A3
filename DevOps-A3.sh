#!/bin/bash

DB_USER="root@localhost"
DB_PASSWORD="mnbvcxz"
DB_NAME="DevOps_Assignment3"

REMOTE_NAME="gdrive"
REMOTE_PATH="/DevOps_Database"

BACKUP_DIR="/home/ahmad/DevOps/Backup"

BACKUP_FILENAME="${DB_NAME}_backup_$(date +\%Y\%m\%d_\%H\%M\%S).sql"
mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_DIR/$BACKUP_FILENAME

rclone copy $BACKUP_DIR/$BACKUP_FILENAME $REMOTE_NAME:$REMOTE_PATH

rm $BACKUP_DIR/$BACKUP_FILENAME
