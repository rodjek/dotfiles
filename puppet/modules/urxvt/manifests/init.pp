class urxvt(
  $user,
  $xresources,
) {
  $packages = [
    'rxvt-unicode',
    'rxvt-unicode-terminfo',
  ]

  package { $packages: }

  file { "/home/${user}/.Xresources":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => $xresources,
    notify => Exec['xrdb/load'],
  }

  exec { 'xrdb/load':
    command     => "/usr/bin/xrdb -load /home/${user}/.Xresources",
    refreshonly => true,
    user        => $user,
    group       => $user,
  }
}
