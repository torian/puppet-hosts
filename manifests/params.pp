
class hosts::params {

	case $::operatingsystem {
		
		default: {
			$owner = 'root'
			$group = 'root'
		}
	}
}

