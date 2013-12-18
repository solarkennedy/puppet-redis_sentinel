# == Class redis_sentinel::service
#
# This class is meant to be called from redis_sentinel
# It ensure the service is running
#
class redis_sentinel::service {

  service { $redis_sentinel::service_name:
    ensure     => $redis_sentinel::service_ensure,
    enable     => $redis_sentinel::service_enable,
    hasstatus  => true,
    hasrestart => true,
  }

}
