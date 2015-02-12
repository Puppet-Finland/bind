#
# == Class: bind
#
# Install and configure bind
#
# == Parameters
#
# [*listen*]
#   The interface bind listens on. Defaults to '127.0.0.1'.
# [*defaultdomain*]
#   Default domain bind uses.
# [*forwarders*]
#   DNS servers to use as forwarders.
# [*allow_address_ipv4*]
#   IPv4 address/subnet from which to allow DNS queries. Defaults to 
#   '127.0.0.1'.
# [*allow_address_ipv6*]
#   IPv6 address/subnet from which to allow DNS queries. Defaults to 
#   '::1'.
# [*monitor_email*]
#   Email address where monitoring notifications are sent. Defaults to top-scope 
#   variable $::servermonitor.
#
class bind
(
  $listen = '127.0.0.1',
  $defaultdomain,
  $forwarders,
  $allow_address_ipv4='127.0.0.1',
  $allow_address_ipv6='::1',
  $monitor_email = $::servermonitor

) inherits bind::params
{

  # Rationale for this is explained in init.pp of the sshd module
  if hiera('manage_bind', 'true') != 'false' {
    
    include bind::install
    
    class { 'bind::config':
      listen => $listen,
      forwarders => $forwarders,
      defaultdomain => $defaultdomain,
      allow_address_ipv4 => $allow_address_ipv4,
      allow_address_ipv6 => $allow_address_ipv6,      
    }
    
    include bind::service

    if tagged('packetfilter') {
        class { 'bind::packetfilter':
            allow_address_ipv4 => $allow_address_ipv4,
            allow_address_ipv6 => $allow_address_ipv6,
        }
    }
}
}
