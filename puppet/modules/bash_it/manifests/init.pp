class bash_it(
  $user,
) {
  exec { 'bash-it/clone':
    command => "git clone https://github.com/Bash-it/bash-it.git /home/${user}/.bash_it",
    path    => ['/usr/sbin', '/usr/bin'],
    user    => $user,
    group   => $user,
    creates => "/home/${user}/.bash_it",
  }

  file { "/home/${user}/.bashrc":
    ensure  => file,
    source  => 'puppet:///modules/dotfiles/bashrc',
    owner   => $user,
    group   => $user,
    mode    => '0644',
    require => [
      Exec['bash-it/clone'],
      File["/home/${user}/.config/bash_it/aliases.bash"],
      File["/home/${user}/.config/bash_it/variables.bash"],
      File["/home/${user}/.config/bash_it/themes/rodjek/rodjek.theme.bash"],
    ],
  }

  file { "/home/${user}/.config/bash_it":
    ensure => directory,
    mode   => '0755',
    owner  => $user,
    group  => $user,
  }

  file { "/home/${user}/.config/bash_it/aliases.bash":
    ensure => file,
    source => 'puppet:///modules/dotfiles/config/bash_it/aliases.bash',
    owner  => $user,
    group  => $user,
    mode   => '0644',
  }

  file { "/home/${user}/.config/bash_it/variables.bash":
    ensure => file,
    source => 'puppet:///modules/dotfiles/config/bash_it/variables.bash',
    owner  => $user,
    group  => $user,
    mode   => '0644',
  }

  file { "/home/${user}/.config/bash_it/themes":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755',
  }

  file { "/home/${user}/.config/bash_it/themes/rodjek":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755',
  }

  file { "/home/${user}/.config/bash_it/themes/rodjek/rodjek.theme.bash":
    ensure => file,
    source => 'puppet:///modules/dotfiles/config/bash_it/themes/rodjek/rodjek.theme.bash',
    owner  => $user,
    group  => $user,
    mode   => '0644',
  }
}
