
class hosts::config($entries = [], $ensure = present) {

	include $hosts::params

	File {
		ensure  => present,
		mode    => 0644,
		owner   => $hosts::params::owner,
		group   => $hosts::params::group,
	}

	file { $hosts::params::hostsfile:
		content => template('hosts/hosts.erb')
	}
}

