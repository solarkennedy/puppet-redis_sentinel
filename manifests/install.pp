# == Class redis_sentinel::intall
#
class redis_sentinel::install {

  file { '/etc/init.d/redis-sentinel':
    ensure   => $redis_sentinel::ensure,
    mode     => '0555',
    owner    => 'root',
    group    => 'root',
    content => template('redis_sentinel/init.erb'),
  }

}
