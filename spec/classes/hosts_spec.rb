
require 'spec_helper'

describe 'hosts' do

	[ 'Debian', 'Redhat' ].each do |os|
		context "Running on #{os}" do
			let(:facts) { { 
				:operatingsystem => os
			} }
			let (:params) { {
				:entries => [ '1.2.3.4 host.example.com host' ]
			} }
			it { should include_class('hosts::params') }
			it {
				should contain_file('/etc/hosts').with( {
				'ensure' => 'present',
				'owner'  => 'root',
				'group'  => 'root',
				'mode'   => '0644'
				} )
			}
			
			it 'contains definitions' do
				should contain_file('/etc/hosts').with_content(
					/^1\.2\.3\.4 host\.example\.com host/
				)
			end
			context 'with motd enabled (enable_motd => true)' do
				let(:params) { { :enable_motd => true } }
				it { should contain_motd__register('Hosts')}
			end
			context 'with motd disabled (enable_motd => false)' do
				let(:params) { { :enable_motd => false } }
				it { should_not contain_motd__register('Hosts')}
			end
		end
	end
	
	context 'Running on unsupported OS' do
		let(:facts) { { 
			:operatingsystem => 'solaris'
		} }
		it do
			expect { 
				should include_class('hosts::params') 
			}.to raise_error(Puppet::Error, /^Operating system.*/)
		end
	end
end

