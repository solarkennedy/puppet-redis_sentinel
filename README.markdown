#redis\_sentinel
[![Build Status](https://travis-ci.org/solarkennedy/puppet-redis_sentinel.png)](https://travis-ci.org/solarkennedy/puppet-redis\_sentinel)

# Warning 
Only currently works on 2.6. Uses the [Old](http://redis.io/topics/sentinel-old)
behavior. The newer sentinel in 2.8 writes its own config file, which I not yet
know how to handle.

##Overview

This puppet module configures the [Redis Sentinel](http://redis.io/topics/sentinel)
to do automatic master/slave control on a bunch of redis servers. (not to be 
confused with [Redis Cluster](http://redis.io/topics/cluster-spec).

##Installation

###What this module affects

* /etc/redis-sentinel.conf
* A redis-sentinel service
* It does *not* depend or interact with any other redis module

##Usage Examples

A simple usage of a single monitor:

    include redis_sentinel
    redis_sentinel::monitor { 'mymaster':
      host                    => '127.0.0.1',
      port                    => '6379',
      quorum                  => '2',
      down_after_milliseconds => '60000',
      failover_timeout        => '900000',
      can_failover            => 'yes',
      parallel_syncs          => '1',
    }

A complex example with an array of redis servers using quorum:

    include redis_sentinel
    $redis_servers = [ 'redis1', 'redis2', 'redis3' ]
    redis_sentinel::monitor { $redis_servers:
      quorum                  => size($redis_servers) / 2 + 1,
      down_after_milliseconds => '60000',
      failover_timeout        => '900000',
      can_failover            => 'yes',
      parallel_syncs          => size($redis_servers),
    }

##Limitations

* Only Supports Redis 2.6.x
* Requires Redis to be installed via another module.
* Not production tested!
* Probably makes assumptions I'm not thinking about (open an issue!)
* Currently runs as root :(

##Requirements

* [Puppetlabs/stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
* [Puppetlabs/concat](https://github.com/puppetlabs/puppetlabs-concat)

##Development
Open an [issue](https://github.com/solarkennedy/puppet-redis_sentinel/issues) or 
[fork](https://github.com/solarkennedy/puppet-redis_sentinel/fork) and open a 
[Pull Request](https://github.com/solarkennedy/puppet-redis_sentinel/pulls)
