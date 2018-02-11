class git(
  $user = $facts['ruid'],
) {
  package { 'git': }

  file { "/home/${user}/.gitconfig":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0644',
    source => 'puppet:///modules/dotfiles/gitconfig',
  }
}
