# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: nginx_hardening::voxpupuli
#
# Overlay provider for voxpupuli/nginx
#
# === Parameters
#
# none
#
class nginx_hardening::voxpupuli(
  $conf_dir = $nginx::conf_dir,
  $package_source = $nginx::package_source
) {
  # try to configure advanced options, if possible
  if $package_source != 'nginx' and $package_source != 'passenger' {
    # install required package
    package { 'nginx-extras':
      ensure => installed,
      alias  => 'nginx-extras'
    }

    # configure options
    $more_clear_headers = [
      '\'Server\'',
      '\'X-Powered-By\''
    ]
  } else {
    $more_clear_headers = []
  }

  # finally we need to make sure our options are written to the config file
  class{'nginx_hardening::voxpupuli_override': }

  # additional configuration

  $client_header_buffer_size = '1k'

  $large_client_header_buffers = '2 1k'

  $client_body_timeout = '10'

  $client_header_timeout = '10'

  $send_timeout = '10'

  $limit_conn_zone = '$binary_remote_addr zone=default:10m'
  $limit_conn = 'default 5'

  $add_headers = [
    # vvoid clickjacking
    'X-Frame-Options SAMEORIGIN',

    # disable content-type sniffing
    'X-Content-Type-Options nosniff',

    # XSS filter
    'X-XSS-Protection "1; mode=block"'
  ]

  # addhardening parameters
  file { "${::nginx::config::conf_dir}/conf.d/90.hardening.conf":
    ensure  => file,
    content => template('nginx_hardening/hardening.conf.erb'),
  }
}
