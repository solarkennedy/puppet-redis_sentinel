require 'spec_helper'

describe 'redis_sentinel' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "redis_sentinel class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily
        }}

        it { should include_class('redis_sentinel::params') }

        it { should contain_class('redis_sentinel::install') }
        it { should contain_class('redis_sentinel::config') }
        it { should contain_class('redis_sentinel::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'redis_sentinel class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta'
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
