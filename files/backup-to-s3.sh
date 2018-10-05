#!/bin/bash

cd /opt/data/backups

BACKUP_FILE="$(ls -Art | tail -n 1)"

echo $BACKUP_FILE

aws s3 cp $BACKUP_FILE s3://msp-confluence-backup/
