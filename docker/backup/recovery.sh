#!/bin/bash

DATE=`date +%Y-%m-%d-%H-%M`
options_table=$(echo "use wordpress;show tables;" | mysql -uroot -pexample -hmysql | grep wp_options)
if [ -f "/tmp/mysql/backup/latest.sql" ]; then
        if [ "$options_table" = "wp_options" ]; then
                        echo "DB exists!"
                        echo "backing up latest sql"
                        mv /tmp/mysql/backup/latest.sql /tmp/mysql/backup/latest_$DATE.sql.BAK
                        mysqldump -uroot -pexample -hmysql wordpress > /tmp/mysql/backup/latest.sql
                else
                        echo "DB not there - create"
                        echo "use wordpress; source /tmp/mysql/backup/latest.sql;" | mysql -uroot -pexample -hmysql
        fi
else
        if [ "$options_table" = "wp_options" ]; then
                mysqldump -uroot -pexample -hmysql wordpress > /tmp/mysql/backup/latest.sql
        fi
fi
