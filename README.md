Nagios Plugins
==============

Collection of Nagios Plugins


check_link_speed.sh
===================

Checks the current negotiated link speed of the network interface. It does this using `ethtool` which requires root access. To give permission to the nagios user to run the check you must edit the sudoers file like so:

```
nagios_user ALL = (ALL) NOPASSWD: /usr/sbin/ethtool
```
