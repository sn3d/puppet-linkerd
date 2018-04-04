# === Class: linkerd::config
#
# (Private) Configure the Linkerd
#
# === Authors
#
# Zdenko Vrabel <vrabel.zdenko@gmail.com>
#
# === Copyright
#
# Copyright 2018 Zdenko Vrabel
#
class linkerd::config(
  $home  = $::linkerd::home,
  $group = $::linkerd::group,
  $user  = $::linkerd::user
) {

  File {
    owner => $user,
    group => $group
  }

  file { '/etc/sysconfig/linkerd':
    ensure => 'file',
    content => template("$module_name/linkerd.environment.erb")
  }

  yaml_setting { 'linkerd::admin::ip':
    target => "$home/config/linkerd.yaml",
    key    => 'admin/ip',
    value  => '0.0.0.0'
  }

  yaml_setting { 'linkerd::admin::port':
    target => "$home/config/linkerd.yaml",
    key    => 'admin/port',
    value  => '9999'
  }
}
