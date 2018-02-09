class urlview(
  $user,
) {
  arch::aur { 'urlview':
    user => $user,
  }

  file { "/home/${user}/.urlview":
    ensure  => file,
    owner   => $user,
    group   => $user,
    mode    => '0644',
    source  => 'puppet:///modules/dotfiles/urlview',
    require => Arch::Aur['urlview'],
  }
}
