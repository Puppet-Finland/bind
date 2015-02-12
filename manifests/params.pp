#
# == Class: bind::params
#
# Defines some variables based on the operating system
#
class bind::params {
  
    case $::osfamily {
        'RedHat': {
            $package_name = [ 'bind', 'bind-chroot' ]
            $config_name = '/etc/named.conf'
            $service_name = 'named'
            $pidfile = '/var/run/named/named.pid'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
