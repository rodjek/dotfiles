class gnupg(
  $user,
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
}
