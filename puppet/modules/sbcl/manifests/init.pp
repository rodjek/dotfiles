class sbcl(
  $user = $facts['ruid'],
) {
  package { 'sbcl': }

  arch::aur { ['cl-launch', 'quicklisp']:
    require => Package['sbcl'],
  }

  file { "/home/${user}/.sbclrc":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/dotfiles/sbclrc',
  }
}
