class spotify {
  $pacman_pkgs = [
    'dbus-glib',
    'gconf',
    'gtk2',
    'libcurl-compat',
    'libxss',
    'nss',
    'rtmpdump',
  ]

  $pacman_pkgs.each |$package| {
    unless defined(Package[$package]) {
      package { $package: }
    }
  }

  arch::aur { 'spotify':
    require => Package[$pacman_pkgs],
  }
}
