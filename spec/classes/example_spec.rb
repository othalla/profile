require 'spec_helper'

describe 'profile' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "profile class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('profile::params') }
          it { is_expected.to contain_class('profile::install').that_comes_before('profile::config') }
          it { is_expected.to contain_class('profile::config') }
          it { is_expected.to contain_class('profile::service').that_subscribes_to('profile::config') }

          it { is_expected.to contain_service('profile') }
          it { is_expected.to contain_package('profile').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'profile class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('profile') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
