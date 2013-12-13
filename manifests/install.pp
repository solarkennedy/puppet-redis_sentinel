# == Class redis_sentinel::intall
#
class redis_sentinel::install {
  include redis_sentinel::params

  package { $redis_sentinel::params::package_name:
    ensure => present,
  }
}
