class gnupg(
  $user = $facts['ruid'],
) {
  package { 'gnupg': }

  file { "/home/${user}/.gnupg":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0700',
  }

  file { "/home/${user}/.gnupg/gpg.conf":
    ensure => file,
    source => 'puppet:///modules/dotfiles/gnupg/gpg.conf',
    owner  => $user,
    group  => $user,
    mode   => '0644',
  }

  file { "/home/${user}/.gnupg/gpg-agent.conf":
    ensure => file,
    source => 'puppet:///modules/dotfiles/gnupg/gpg-agent.conf',
    owner  => $user,
    group  => $user,
    mode   => '0644',
  }

  file { '/etc/udev/rules.d/yubikey.rules':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => 'ATTRS{idVendor}=="1050", ATTRS{idProduct}=="0405", MODE="644", GROUP="alarm"',
  }
}
