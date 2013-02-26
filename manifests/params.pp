
class hosts::params {

	case $::operatingsystem {
		
		default: {
			$hostsfile = '/etc/hosts'
			$owner     = 'root'
			$group     = 'root'
		}
	}
}

