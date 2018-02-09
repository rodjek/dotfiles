define arch::aur() {
  $unique_str = $facts['uptime_seconds']

  exec { "aur/${name}/clone":
    command => "git clone https://aur.archlinux.org/${name}.git ${name}-${unique_str}",
    cwd     => '/tmp',
    unless  => "pacman -Q ${name}",
    path    => ['/usr/bin', '/usr/sbin'],
    creates => "/tmp/${name}-${unique_str}",
    notify  => Exec["aur/${name}/makepkg"],
    user    => 'tsharpe',
    group   => 'tsharpe',
  }

  exec { "aur/${name}/makepkg":
    command     => 'makepkg -si --needed --noconfirm --noprogressbar',
    cwd         => "/tmp/${name}-${unique_str}",
    refreshonly => true,
    path        => ['/usr/bin', '/usr/sbin'],
    user        => 'tsharpe',
    group       => 'tsharpe',
  }
}
