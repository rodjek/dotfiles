class i3 (
  $user,
  $config,
) {
  $packages = [
    'i3-gaps',
    'compton',
    'rofi',
    # TODO: hsetroot from AUR
  ]

  package { $packages: }

  $config_dir = "/home/${user}/.config/i3"

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
    notify => Exec['i3-msg reload'],
  }

  exec { 'i3-msg reload':
    refreshonly => true,
    path        => ['/usr/bin', '/usr/sbin'],
    user        => $user,
    group       => $user,
  }
}
