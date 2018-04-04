class linkerd::namer::fs(
  $config_file = "$::linkerd::home/config/linkerd.yaml",
  $host = undef,
  $port = 8080,
  $uri_prefix = "/marathon"
) {
  concat::fragment{ "linkerd_fragment_namer_marathon":
    target  => $config_file,
    content => template("$module_name/linkerd.namer.marathon.erb"),
    order   => 102
  }
}
