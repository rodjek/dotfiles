class mbsync(
  $user = $facts['ruid'],
) {
  package { 'isync': }

  $directories = [
    "/home/${user}/.mail",
    "/home/${user}/.mail/personal",
    "/home/${user}/.mail/puppet",
  ]

  file { $directories:
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755',
  }

  file { "/home/${user}/.mbsyncrc":
    ensure  => file,
    owner   => $user,
    group   => $user,
    mode    => '0644',
    source  => 'puppet:///modules/dotfiles/mbsyncrc',
    require => [
      Package['isync'],
      File[$directories],
    ],
  }
}
