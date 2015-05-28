# ttrss #

This [Ansible](http://www.ansible.com/home) role will install [Tiny Tiny RSS](http://tt-rss.org/) from source with PostgreSQL and nginx.

## Role Variables ##

### Required ###

* `ttrss_db_pass` - Password for PostgreSQL user.

### Optional ###

* `ttrss_db_name` - PostgreSQL database name (default: `ttrss`)
* `ttrss_db_user` - PostgreSQL database user (default: `ttrss`)
* `ttrss_install_path` - Location to install TTRSS (default: `/var/www/ttrss`)

When I integrate with duply, I'm sure I'll use some variables out of there as well.

## Example Playbook ##

A simple playbook that just sets the one required variable:

    - hosts: all
      sudo: yes
      roles:
         - role: isaacsimmons.ttrss
           ttrss_db_pass: secret

A more complex example:

    coming soon

## License ##

Simplified BSD
