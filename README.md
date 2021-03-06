# ttrss #

This [Ansible](http://www.ansible.com/home) role will install [Tiny Tiny RSS](http://tt-rss.org/) from source.
It relies on PostgreSQL, PHP, and nginx.
It has been tested on Debian and Ubuntu hosts.

## Role Variables ##

### Required ###

* `ttrss_db_pass` - Password for PostgreSQL user.

### Optional ###

* `ttrss_db_name` - PostgreSQL database name (default: `ttrss`)
* `ttrss_db_user` - PostgreSQL database user (default: `ttrss`)
* `ttrss_install_path` - Location to install TTRSS (default: `/var/www/ttrss`)
* `ttrss_git_url` - URL for the tt-rss git repository (default: `https://tt-rss.org/gitlab/fox/tt-rss.git`)

### External ###

* `nginx_base_url` - Reads from external role to determine base public URL for site

### Optional External ###

* `backup_home` - Directory in which to create ttrss backup scripts and stage database backups

## Dependencies ##

* `ansible-role-lnpp` - Depends on nginx, PostgreSQL, and PHP installation as well as multi-app nginx config. Available at <https://github.com/isaacsimmons/ansible-role-lnpp>

### Optional ###

* `ansible-role-duplicity` - Depends on duplicity scripts if automated backups are desired. Available at <https://github.com/isaacsimmons/ansible-role-duplicity>

## Example Playbook ##

A simple playbook that just sets the one required variable:

    - hosts: all
      sudo: yes
      roles:
         - role: ../ansible-role-lnpp
         - role: ../ansible-role-ttrss
           ttrss_db_pass: secret

## License ##

Simplified BSD
