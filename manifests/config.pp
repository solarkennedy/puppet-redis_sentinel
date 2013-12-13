# == Class redis_sentinel::config
#
# This class is called from redis_sentinel
#
class redis_sentinel::config {

  concat { $redis_sentinel::config_file:
    owner => 'root',
    group => 'root',
    mode  => '0440',  
  }
  
  concat::fragment { 'sentinel_header': 
    target  => $redis_sentinel::config_file,
    content => "#This file managed by the redis_sentinel puppet module\n",
    order   => '01',
  }

}
