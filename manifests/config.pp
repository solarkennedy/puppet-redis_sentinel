# == Class redis_sentinel::config
#
# This class is called from redis_sentinel
#
class redis_sentinel::config {

  concat { $redis_sentinel::config_file:
    owner => $redis_sentinel::user,
    group => $redis_sentinel::group,
    mode  => '0440',  
  }

  concat::fragment { 'sentinel_header': 
    target  => $redis_sentinel::config_file,
    content => "#This file managed by the redis_sentinel puppet module\ndaemonize yes\nlogfile /var/log/redis/redis-sentinel.log\npidfile /var/run/redis/redis-sentinel.pid",
    order   => '01',
  }

}
