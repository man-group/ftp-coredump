
## Core dumps over FTP

This repo contains a script that lets you dump core over FTP, and the associated ansible roles required to set it up.

If you aren't using ansible, you could just edit the ftp-coredump.sh.j2 script. To do that, just replace any Jinja2 `{{somevar}}` variables with actual values, and also set the `kernel.core_location` sysctl pattern as shown in `ansible/roles/ftp_coredump/defaults/main.yml`.


## License

This code is licensed under the GNU GPL 2.0 license, a copy of which is included in [LICENSE](LICENSE).
