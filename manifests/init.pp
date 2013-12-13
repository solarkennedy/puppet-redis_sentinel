# == Class: redis_sentinel
#
# Full description of class redis_sentinel here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class redis_sentinel (
) inherits redis_sentinel::params {

  # validate parameters here

  class { 'redis_sentinel::install': } ->
  class { 'redis_sentinel::config': } ~>
  class { 'redis_sentinel::service': } ->
  Class['redis_sentinel']
}
