#
# == Class: bind::install
#
# This class installs the bind daemon
#
class bind::install inherits bind::params {

    package { $::bind::params::package_name:
        ensure => installed,
    }
}
