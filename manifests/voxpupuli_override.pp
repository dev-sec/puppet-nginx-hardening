# === Copyright
#
# Copyright 2014, Deutsche Telekom AG
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#

# == Class: nginx_hardening::voxpupuli_override
#
# Overlay provider for voxpupuli/nginx
#
# === Parameters
#
# none
#
class nginx_hardening::voxpupuli_override inherits ::nginx::config {
  
  $server_tokens = 'off'

  $keepalive_timeout = '5 5'

  $client_body_buffer_size = '1k'

  $client_max_body_size = '1k'

  File["${::nginx::conf_dir}/nginx.conf"]{
    content => template($::nginx::conf_template),
    mode   => '0600',
  }

}
