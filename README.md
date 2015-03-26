# ttrss #

This [Ansible](http://www.ansible.com/home) role will install [Tiny Tiny RSS](http://tt-rss.org/) from source with PostgreSQL and nginx.

## Role Variables ##

### Required ###

* `ttrss_db_pass` - Password for PostgreSQL user.

### Optional ###

* `ttrss_use_ssl` - `true` to serve the site over https, `false` to serve the site over http (default: `false`)
* `ttrss_port` - Port to serve the site over (default: `80` or `443` depending on `ttrss_use_ssl` setting)
* `ttrss_hostname` - Hostname where the site will be accessible (default: `{{ inventory_hostname }}`)
* `ttrss_db_name` - PostgreSQL database name (default: `ttrss`)
* `ttrss_db_user` - PostgreSQL database user (default: `ttrss`)
* `ttrss_install_path` - Location to install TTRSS (default: `/var/www/ttrss`)
* `ttrss_base_url` - Full URL where the site will be accessible (default: Based on `hhrss_use_ssl`, `ttrss_hostname`, and `ttrss_port`)'
* `keep_nginx_default_site` - `true` to leave the 'default' nginx site, `false` to delete it (default: `false`)
* `ttrss_feed_crypt_key` - Used to encrypt credentials in database for authenticated feeds. Must be exactly 24 characters (default: `ABCDEFGHIJKLMNOPQRSTUVWX`)

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

BSD

