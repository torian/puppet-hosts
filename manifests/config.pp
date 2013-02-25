
class hosts::config {

	# It is easier to include variables in this scope
	# than to call scope.lookupvar('scope::varname')
	# inside the template
	
	File {
		ensure  => present,
		mode    => 0644,
		owner   => $hosts::params::owner,
		group   => $hosts::params::group,
	}

	file { '/etc/hosts':
		content => template("hosts/hosts.erb")
	}
}

