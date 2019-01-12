# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: nginx_hardening
#
# Configures overlay hardening
#
# === Parameters
#
# [*provider*]
#   The name of the provider you use to install nginx.
#   Supported: `jfryman/nginx`
#
class nginx_hardening(
  $provider = 'none',
) {
  case $provider {
    'jfryman/nginx': {
      class{'nginx_hardening::jfryman': }
    }
    'voxpupuli/nginx': {
      class{'nginx_hardening::voxpupuli': }
    }
    'none': {
      fail('You haven\'t configured a Nginx provider for hardening.')
    }
    default: {
      fail('Unrecognized/Unsupported Nginx provider for hardening.')
    }
  }
}
