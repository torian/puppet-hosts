
class hosts($entries = [], $ensure = 'present') {

        include hosts::params
        class { 'hosts::config':
		entries => $entries
	}

}
