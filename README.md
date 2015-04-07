# ttrss #

This [Ansible](http://www.ansible.com/home) role will install [Tiny Tiny RSS](http://tt-rss.org/) from source with PostgreSQL and nginx.

## Role Variables ##

### Required ###

* `ttrss_db_pass` - Password for PostgreSQL user.

### Optional ###

* `ttrss_use_https` - `true` to serve the site over https, `false` to serve the site over http (default: `false`)
* `ttrss_cert_path` - Path to already existing certificate on the server. If this is set, then it will be used instead of copying a key from `./files/ttrss.key`. (default: `''`, ignored if `ttrss_use_https` is false)
* `ttrss_cert_key_path` - Path to already existing certificate key on the server. If this is set, then it will be used instead of copying a key from `./files/ttrss.key`. (default: `''`, ignored if `ttrss_use_https` is false)
* `ttrss_port` - Port to serve the site over (default: `80` or `443` depending on `ttrss_use_https` setting)
* `ttrss_hostname` - Hostname where the site will be accessible (default: `{{ inventory_hostname }}`)
* `ttrss_db_name` - PostgreSQL database name (default: `ttrss`)
* `ttrss_db_user` - PostgreSQL database user (default: `ttrss`)
* `ttrss_install_path` - Location to install TTRSS (default: `/var/www/ttrss`)
* `ttrss_base_url` - Full URL where the site will be accessible (default: Based on `ttrss_use_https`, `ttrss_hostname`, and `ttrss_port`)'
* `keep_nginx_default_site` - `true` to leave the 'default' nginx site, `false` to delete it (default: `false`)

When using HTTPS (`ttrss_use_https`) you must either set `ttrss_cert_path` and `ttrss_cert_key_path` to certificates already present on the host, or place a `ttrss.crt` and `ttrss.key` in ansible's path (for instance in `./files`). If you plan to use self-signed certificates, they can be generated with the `generate-cert.sh` script.

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
