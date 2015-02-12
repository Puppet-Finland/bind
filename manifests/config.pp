#
# Class: bind::config
#
# Setup named.conf
#
class bind::config 
(
  $listen,
  $defaultdomain,
  $forwarders,
  $allow_address_ipv4,
  $allow_address_ipv6

) inherits bind::params
{
    include os::params
    
    # convention: modulename-filename
    file { 'bind-named.conf':
      name => $::bind::params::config_name,
      content => template('bind/named.conf.erb'),
      ensure => present,
      owner => root,
      group => $::os::params::admingroup,
      mode => 755,
      require => Class['bind::install'],
      notify => Class['bind::service'],
    }
    
    # convention: modulename-filename
    file { [ '/var/named/chroot',
             '/var/named/chroot/var',
             '/var/named/chroot/var/named',
             '/var/named/chroot/var/named/data' ]:
      ensure => directory,
      owner => root,
      group => $::os::params::admingroup,
      mode => 755,
      require => Class['bind::install'],
    }
    
    bind::zone { "bind-$defaultdomain":
      domainname => $defaultdomain,
    }
}
  
  
