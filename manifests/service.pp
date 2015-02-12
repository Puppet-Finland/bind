#
# == Class: bind::service
#
# This class configures the bind service
#
class bind::service inherits bind::params {

    service { 'bind':
        name => $::bind::params::service_name,
        enable => true,
        ensure => running,   
        require => Class['bind::install'],
    }
}
