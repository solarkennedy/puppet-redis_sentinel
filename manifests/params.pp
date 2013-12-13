# == Class redis_sentinel::params
#
# This class is meant to be called from redis_sentinel
# It sets variables according to platform
#
class redis_sentinel::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'redis_sentinel'
      $service_name = 'redis_sentinel'
    }
    'RedHat', 'Amazon': {
      $package_name = 'redis_sentinel'
      $service_name = 'redis_sentinel'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
