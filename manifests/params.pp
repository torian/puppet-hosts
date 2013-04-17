
class hosts::params {

	case $::operatingsystem {
		
		'Debian': {
			$hostsfile = '/etc/hosts'
			$owner     = 'root'
			$group     = 'root'
		}
		
		'Redhat': {
			$hostsfile = '/etc/hosts'
			$owner     = 'root'
			$group     = 'root'
		}
		
		'SLES': {
			$hostsfile = '/etc/hosts'
			$owner     = 'root'
			$group     = 'root'
		}

		default: {
			fail("Operating system ${::operatingsystem} not supported yet")
		}
	}
}

