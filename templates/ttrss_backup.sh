#!/bin/bash

#Disable site
rm /etc/nginx/apps-enabled/ttrss
service nginx restart

#dump the database
su - postgres -c "pg_dump -c {{ ttrss_db_name }}" > "{{ ttrss_backup_stage }}/db.sql"
#su - postgres -c "pg_dump -ab -T ttrss_entries -T ttrss_enclosures -T ttrss_entry_comments -T ttrss_user_entries -T ttrss_user_labels2 ttrss" > "{{ ttrss_backup_home }}/db.sql"
#TODO: check if excluding these tables messes up refreshes
#TODO: if I exclude them, execute an update "after_restore"


#Enable site
ln -s /etc/nginx/apps-available/ttrss /etc/nginx/apps-enabled/ttrss
service nginx restart

