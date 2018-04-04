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

}
