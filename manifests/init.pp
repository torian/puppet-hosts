# Class: hosts
#
#   This module is a parametrized class used to include
#   hosts definitions in the hosts file.
#
#   Emiliano Castagnari (torian) <ecastag@gmail.com>
#   2012/11/02
#
# Tested platforms:
#
#	Debian
#	Redhat
#	OEL
#
# Parameters:
#
#	entries: an array that holds e host definition line
#	ipv6:    enable IPV6 support (this only adds the localhost ipv6 definitions)
#	enable:  true | false
#
# Requires:
#
#	puppet-motd: https://github.com/torian/puppet-motd
#
# Sample Usage:
#
#   node mynode.example.com {
#
#     # ...
#    
#     class { 'hosts':
#       entries => [ '1.2.3.4  host.example.com host', '2.3.4.5 host2.example.com host2' ]
#     }
#     
#   }
# 
class hosts(
  $entries     = [],
  $ipv6        = false,
  $enable_motd = false,
  $lo          = false,
  $ensure      = present) {
	
  include hosts::params
	
  if($enable_motd) {
    motd::register { 'Hosts': }
  }
	
  File {
    ensure  => present,
    mode    => '0644',
    owner   => $hosts::params::owner,
    group   => $hosts::params::group,
  }

  file { $hosts::params::hostsfile:
    content => template('hosts/hosts.erb')
  }
}

