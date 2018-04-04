class linkerd::namer::fs(
  $config_file = "$::linkerd::home/config/linkerd.yaml",
  $rootDir = "disco"
) {
  concat::fragment{ "linkerd_fragment_namer_fs":
    target  => $config_file,
    content => template("$module_name/linkerd.namer.fs.erb"),
    order   => 101
  }
}
