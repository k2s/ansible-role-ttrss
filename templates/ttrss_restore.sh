#!/bin/bash

#Disable site
rm /etc/nginx/apps-enabled/ttrss
service nginx restart

#dump the database
su - postgres -c "psql {{ ttrss_db_name }}" < "{{ ttrss_backup_stage }}/db.sql" >/dev/null

#Enable site
ln -s /etc/nginx/apps-available/ttrss /etc/nginx/apps-enabled/ttrss
service nginx restart

