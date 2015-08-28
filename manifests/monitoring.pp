# == Class: redis_sentinel::monitoring
#
# Creates monitoring scripts under desired path.
#
class redis_sentinel::monitoring ($checks_path = "/usr/local/bin") {
  file { "${checks_path}/check_sentinel":
    owner  => "root",
    group  => "root",
    mode   => "0755",
    source => "puppet:///modules/${module_name}/check_sentinel"
  }

  file { "${checks_path}/check_sentinel_master":
    owner  => "root",
    group  => "root",
    mode   => "0755",
    source => "puppet:///modules/${module_name}/check_sentinel_master"
  }

  file { "${checks_path}/check_sentinel_master_health":
    owner  => "root",
    group  => "root",
    mode   => "0755",
    source => "puppet:///modules/${module_name}/check_sentinel_master_health"
  }
}
