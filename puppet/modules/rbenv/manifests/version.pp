define rbenv::version(
  $user = $facts['ruid'],
) {
  include rbenv

  exec { "rbenv/install/${name}":
    command => "rbenv install ${name}",
    path    => ['/usr/sbin', '/usr/bin'],
    user    => $user,
    group   => $user,
    cwd     => "/home/${user}",
    creates => "/home/${user}/.rbenv/versions/${name}",
    require => Class['rbenv'],
  }
}
