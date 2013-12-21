# == Class redis_sentinel::intall
#
class redis_sentinel::install {

  #TODO: This isn't really a good way to figure out if an OS is upstart capable or not
  case $::osfamily {
    'RedHat': {
      file { '/etc/init.d/redis-sentinel':
        ensure   => $redis_sentinel::ensure,
        mode     => '0555',
        owner    => 'root',
        group    => 'root',
        content => template('redis_sentinel/init.erb'),
      }
    }
    'Debian': {
      file { '/etc/init/redis-sentinel':
        ensure   => $redis_sentinel::ensure,
        mode     => '0555',
        owner    => 'root',
        group    => 'root',
        content => template('redis_sentinel/upstart.erb'),
      }
      file { '/etc/init.d/redis-sentinel':
       ensure => 'link',
       target => '/lib/init/upstart-job',
       force  => true,
      }

    }
    default: { fail('Unknown OS') }
  } 
}
