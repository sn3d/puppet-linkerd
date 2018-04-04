# === Class: linkerd::service
#
# (Private) Setup the service for linkerd
#
# === Authors
#
# Zdenko Vrabel <vrabel.zdenko@gmail.com>
#
# === Copyright
#
# Copyright 2018 Zdenko Vrabel
#
class linkerd::service(
  $service_provider = $::linkerd::service_provider,
  $home             = $::linkerd::home,
  $version          = $::linkerd::version,
  $user             = $::linkerd::user,
  $group            = $::linkerd::group
) {

  case $service_provider {
    'systemd': {
      file { '/usr/lib/systemd/system/linkerd.service':
        content => template("$module_name/linkerd.service.erb"),
        owner   => 'root',
        group   => 'root',
        mode    => '644',
        before  => Service['linkerd']
      }
    },
    'init.d': {
      fail('Init.d is unsupported')
    },
    default: {
      fail('Valid service providers are `systemd` or `init.d`')
    }
  }
  
  service { 'linkerd':
    ensure => 'running'
  }

}
