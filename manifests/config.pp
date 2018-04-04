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

  concat { "$home/config/linkerd.yaml": }

  concat::fragment{ 'linkerd_fragment_admin':
    target  => "$home/config/linkerd.yaml",
    content => template("$module_name/linkerd.admin.erb"),
    order   => '1'
  }

  concat::fragment{ 'linkerd_fragment_namers':
    target  => "$home/config/linkerd.yaml",
    content => "\nnamers:\n",
    order   => '100'
  }

  concat::fragment{ 'linkerd_fragment_routers':
    target  => "$home/config/linkerd.yaml",
    content => "\nrouters:\n",
    order   => '200'
  }

}
