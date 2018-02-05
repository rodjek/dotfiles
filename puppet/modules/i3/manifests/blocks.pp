class i3::blocks (
  $user,
  $config,
) {
  package { 'i3blocks': }

  $config_dir = "/home/${user}/.config/i3blocks"

  file { $config_dir:
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755',
  }

  file { "${config_dir}/config":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => $config,
  }
}
