# == Class redis_sentinel::service
#
# This class is meant to be called from redis_sentinel
# It ensure the service is running
#
class redis_sentinel::service {
  include redis_sentinel::params

  service { $redis_sentinel::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
