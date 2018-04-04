# === Class: linkerd::install::archive
#
# (Private) Install the Linkerd from archive
#
# === Authors
#
# Zdenko Vrabel <vrabel.zdenko@gmail.com>
#
# === Copyright
#
# Copyright 2018 Zdenko Vrabel
#
class linkerd::install::archive(
  $archive_url      = $::linkerd::archive_url,
  $archive_dl       = $::linkerd::archive_dl,
  $home             = $::linkerd::home,
  $user             = $::linkerd::user,
  $group            = $::linkerd::group,
  $service_provider = $::linkerd::service_provider
) {

  File {
    owner => $user,
    group => $group
  }

  wget::fetch { $linkerd_archive:
    source      => $archive_url,
    destination => $dl_file,
    before      => Exec['linkerd-untar'],
  }

  exec { 'linkerd-untar':
    command => "tar zxf ${archive_dl} --directory ${home}",
    creates => $home,
    path    => ['/bin','/usr/bin'],
  }
}
