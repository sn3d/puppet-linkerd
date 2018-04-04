# === Class: linkerd::install
#
# (Private) Install the Linkerd
#
# === Authors
#
# Zdenko Vrabel <vrabel.zdenko@gmail.com>
#
# === Copyright
#
# Copyright 2018 Zdenko Vrabel
#
class linkerd::install(
    $install_method = $::linkerd::install_method,
    $manage_user    = $::linkerd::manage_user,
    $group          = $::linkerd::group,
    $user           = $::linkerd::user
) {

  if ($manage_user) {
    group { $group:
       ensure = 'present'
    }

    user { $user:
       ensure => 'present'
       require => Group[$group],
       before => Anchor['linkerd_pretinstall']
    }
  }

  case $install_method {
    'archive': {
      class { 'linkerd::install::archive':
        before => Anchor['linkerd_install']
      }
    },
    'package': {
      class { 'linkerd::install::package':
        before => Anchor['linkerd_install']
      }
    },
    default: {
      fail('Valid installation methods are `package` or `archive`')
    }
  }

  anchor { 'linkerd_preinstall': } ->
  anchor { 'linkerd_install': } ->
  anchor { 'linkerd_postinstall': } ->

}
