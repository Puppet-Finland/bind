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

    firewall { "007 ipv4 accept bind":
        provider => 'iptables',
        chain => 'INPUT',
        proto => 'udp',
        action => 'accept',
        source => $allow_address_ipv4,
        dport => 53,
    }

    firewall { "007 ipv6 accept bind":
        provider => 'ip6tables',
        chain => 'INPUT',
        proto => 'udp',
        action => 'accept',
        source => $allow_address_ipv6,
        dport => 53,
    }
}
