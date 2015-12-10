#!/bin/bash

#Disable site
rm /etc/nginx/apps-enabled/ttrss
service nginx reload > /dev/null

#dump the database
su - postgres -c "pg_restore -d {{ ttrss_db_name }}" < "{{ ttrss_backup_stage }}/db.sql.gz" >/dev/null

#Enable site
ln -s /etc/nginx/apps-available/ttrss /etc/nginx/apps-enabled/ttrss
service nginx reload > /dev/null
