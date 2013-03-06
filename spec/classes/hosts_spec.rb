
require 'spec_helper'

describe 'hosts' do

	context 'Running on Debian' do
		let(:facts) { { 
			:operatingsystem => 'Debian'
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
	end
	
	context 'Running on Redhat' do
		let(:facts) { { 
			:operatingsystem => 'Redhat'
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
	
	context 'Without hosts definitions' do
		let (:params) { {
			:entries => nil
		} }
	end

	context 'With hosts definitions' do
		let (:facts)  { { :operatingsystem => 'Debian' } }
		let (:params) { {
			:entries => [ '1.2.3.4 host.example.com host' ]
		} }
		it do
			should contain_file('/etc/hosts').with_content(
				/^1\.2\.3\.4 host\.example\.com host/
			)
		end
	end
end

