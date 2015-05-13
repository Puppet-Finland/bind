#
# == Class: bind::packetfilter
#
# This class configures packetfilter to only let in traffic from specified 
# IP-addresses to the bind daemon
#
class bind::packetfilter
(
    $allow_address_ipv4,
    $allow_address_ipv6

) inherits bind::params
{

    Firewall {
        chain    => 'INPUT',
        proto    => 'udp',
        action   => 'accept',
        dport    => 53,
    }

    firewall { '007 ipv4 accept bind':
        provider => 'iptables',
        source   => $allow_address_ipv4,
    }

    firewall { '007 ipv6 accept bind':
        provider => 'ip6tables',
        source   => $allow_address_ipv6,
    }
}
