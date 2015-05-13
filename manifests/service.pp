#
# == Class: bind::service
#
# This class configures the bind service
#
class bind::service inherits bind::params {

    service { 'bind':
        ensure  => running,
        name    => $::bind::params::service_name,
        enable  => true,
        require => Class['bind::install'],
    }
}
