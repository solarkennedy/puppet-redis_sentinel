require 'spec_helper'

describe 'redis_sentinel' do
  context 'With default paramaters' do
    describe "redis_sentinel" do
      let(:params) {{ }}
      let(:facts) {{
        :concat_basedir => '/dne',
        :osfamily       => 'Debian'
      }}

      it { should contain_class('redis_sentinel::install') }
      it { should contain_class('redis_sentinel::config') }
      it { should contain_class('redis_sentinel::service') }
    end
  end
end

