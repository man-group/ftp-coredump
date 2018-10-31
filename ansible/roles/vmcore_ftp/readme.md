Description
---

This role configures FTP based system crash dumps.

Kdump doesn't natively support ftp based kdumps, but we use a kdump_pre script, which:
  - brings up networking
  - makedumpfile's the core
  - sends it (inline) to the configured FTP server.

When bringing up networking, the script will first try using DHCP, but if that doesn't work, it will revert to the static IP the box had when ansible was last run against it.


Configuration
---

These variables should be set for the hosts (or changed in defaults/main.yml)

```
crashdump_ftp_server      Set to an FTP server that allows upload by the user ftp.
default_dns_servers       Space separated list of DNS servers for your environment
crashdump_ftp_basepath    The directory to upload to on the FTP server. Defaults
                          to 'crashdump'
```
