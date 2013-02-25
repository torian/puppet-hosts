
require 'spec_helper'

describe 'hosts' do

	#let (:facts) { {
	#	:operatingsystem => 'Debian',
	#} }
	it { should include_class('hosts::params')          }
	it { should include_class('hosts::config')          }
	it do
		 should contain_file('/etc/hosts').with({
			'ensure' => 'present',
			'owner'  => 'root',
			'group'  => 'root',
			'mode'   => '0644'
			} )
	end

	context 'with valid entries' do
		let (:params) { {
			:entries => [ '1.2.3.4 host.example.com host' ]
		} }
		it do
			should contain_file('/etc/hosts').with_content(/^1\.2\.3\.4 host\.example\.com host/)
			
		end
	end
end

