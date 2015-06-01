# nginx_hardening (Puppet module)

[![Puppet Forge](https://img.shields.io/puppetforge/dt/hardening/nginx_hardening.svg)][1]
[![Build Status](http://img.shields.io/travis/hardening-io/puppet-nginx-hardening.svg)][2]
[![Gitter Chat](https://badges.gitter.im/Join%20Chat.svg)][3]

## Description

This module provides hardening configuration for Nginx.

## Requirements

* Puppet
* Supported module: `jfryman/nginx`


## Parameters

none

## Usage

If you use `jfryman/nginx`:

    # Configure Nginx as you normally would:
    class { 'nginx': }
    ...

    # now include hardening:
    class { 'nginx_hardening':  provider => 'jfryman/nginx'}

## Local Testing

For local testing you can use vagrant and Virtualbox of VMWare to run tests locally. You will have to install Virtualbox and Vagrant on your system. See [Vagrant Downloads](http://downloads.vagrantup.com/) for a vagrant package suitable for your system. For all our tests we use `test-kitchen`. If you are not familiar with `test-kitchen` please have a look at [their guide](http://kitchen.ci/docs/getting-started).

Next install test-kitchen:

```bash
# Install dependencies
gem install bundler
bundle install

# Fetch tests
bundle exec thor kitchen:fetch-remote-tests

# Do lint checks
bundle exec rake lint

# Do spec checks
bundle exec rake spec

# fast test on one machine
bundle exec kitchen test default-ubuntu-1204

# test on all machines except Debian-based machines
bundle exec kitchen test

# for development
bundle exec kitchen create default-ubuntu-1204
bundle exec kitchen converge default-ubuntu-1204
```

For more information see [test-kitchen](http://kitchen.ci/docs/getting-started)


## Contributors + Kudos

...

## License and Author

* Author:: Dominik Richter <dominik.richter@googlemail.com>
* Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[1]: https://forge.puppetlabs.com/hardening/nginx_hardening
[2]: http://travis-ci.org/hardening-io/puppet-nginx-hardening
[3]: https://gitter.im/hardening-io/general
