require 'spec_helper'
describe 'redis_sentinel::monitor', :type => :define do

  #sentinel monitor mymaster 127.0.0.1 6379 2
  #sentinel down-after-milliseconds mymaster 60000
  #sentinel failover-timeout mymaster 900000
  #sentinel can-failover mymaster yes
  #sentinel parallel-syncs mymaster 1
  Puppet::Util::Log.level = :debug
  Puppet::Util::Log.newdestination(:console)

  let(:title) { 'mymaster' }
  let(:facts) {{
    :concat_basedir => '/dne',
    :osfamily       => 'Debian'
  }}
  let(:params) do {
    :host                    => '127.0.0.1',
    :port                    => '6379',
    :quorum                  => '2',
    :down_after_milliseconds => '60000',
    :failover_timeout        => '900000',
    :can_failover            => 'yes',
    :parallel_syncs          => '1'
  } end

  describe 'should generate a fragment with all the pieces' do
    # Should at least have the define
    it { should contain_redis_sentinel__monitor(title) }

    it 'should pass input validation' do
      expect { subject }.to_not raise_error
    end

    it {
      should contain_concat__fragment('redis_sentinel_mymaster').with_content(/sentinel monitor mymaster 127\.0\.0\.1 6379 2/)
      should contain_concat__fragment('redis_sentinel_mymaster').with_content(/sentinel down-after-milliseconds mymaster 60000/)
      should contain_concat__fragment('redis_sentinel_mymaster').with_content(/sentinel failover-timeout mymaster 900000/)
      should contain_concat__fragment('redis_sentinel_mymaster').with_content(/sentinel can-failover mymaster yes/)
      should contain_concat__fragment('redis_sentinel_mymaster').with_content(/sentinel parallel-syncs mymaster 1/)
    }
  end

end
