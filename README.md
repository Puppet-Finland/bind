# bind

A Puppet module for managing Bind. For the most part follows the Secure Bind 
Template guidelines:

* http://www.cymru.com/Documents/secure-bind-template.html

# Module usage

* [Class: bind](manifests/init.pp)
* [Define: bind::zone](manifests/zone.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* CentOS 6

The following operating systems should work out of the box or with small 
modifications:

* Debian
* FreeBSD

For details see [params.pp](manifests/params.pp).
