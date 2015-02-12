#
# == Define: bind::zone
#
# Setup a bind zone
#
# == Parameters
#
# [*domainname*]
#   Name of the domain. The zone file for the domain must reside on the Puppet 
#   file server and named as "bind-zone-$domainname".
#
define bind::zone
(
  $domainname
)
{
  
  include os::params

  file { "bind-zone-$domainname":
    name =>  "/var/named/chroot/var/named/data/$domainname",
    ensure => present,
    source => "puppet:///files/bind-zone-$domainname",
    owner => root,
    group => "${::os::params::admingroup}",
    mode => 644,
    require => File['/var/named/chroot/var/named/data'],
    notify => Class['bind::service'],
  }
}
