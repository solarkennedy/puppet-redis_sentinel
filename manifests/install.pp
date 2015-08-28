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
        content => template("${module_name}/init.erb"),
      }
    }
    'Debian': {
      file { '/etc/init/redis-sentinel.conf':
        ensure   => $redis_sentinel::ensure,
        mode     => '0444',
        owner    => 'root',
        group    => 'root',
        content => template("${module_name}/upstart.erb"),
      }
      file { '/etc/init.d/redis-sentinel':
       ensure => 'link',
       target => '/lib/init/upstart-job',
       force  => true,
      }

    }
    'FreeBSD': {
      file { '/usr/local/etc/rc.d/redis-sentinel':
        ensure   => $redis_sentinel::ensure,
        mode     => '0555',
        owner    => 'root',
        group    => 'wheel',
        content => template("${module_name}/rc.d.erb"),
      }
    }
    default: { fail('Unknown OS') }
  } 
}
