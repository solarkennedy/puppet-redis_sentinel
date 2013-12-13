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

###Wha module affects

* /etc/redis-sentinel.conf
* A redis-sentinel service
* It does *not* depend or interact with any other redis module

##Usage

##Limitations

* Only Supports Redis 2.6.x
* Requires Redis to be installed via another module.

##Requirements

* Puppetlabs/stdlib
* Puppetlabs/concat

##Development
Open an [issue](https://github.com/solarkennedy/puppet-redis_sentinel/issues) or 
[fork](https://github.com/solarkennedy/puppet-redis_sentinel/fork) and open a 
[Pull Request](https://github.com/solarkennedy/puppet-redis_sentinel/pulls)
