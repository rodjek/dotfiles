class sbcl(
  $user = $facts['ruid'],
) {
  package { 'sbcl': }

  arch::aur { 'cl-launch':
    require => Package['sbcl'],
  }

  exec { 'sbcl/quicklisp/download':
    command => 'curl -O https://beta.quicklisp.org/quicklisp.lisp',
    path    => ['/usr/bin'],
    cwd     => '/tmp',
    user    => $user,
    group   => $user,
    creates => "/home/${user}/quicklisp/setup.lisp",
    notify  => Exec['sbcl/quicklisp/install'],
  }

  exec { 'sbcl/quicklisp/install':
    command     => 'sbcl --load /tmp/quicklisp.lisp --eval "(quicklisp-quickstart:install)"',
    path        => ['/usr/bin'],
    cwd         => "/home/${user}",
    user        => $user,
    group       => $user,
    refreshonly => true,
    require     => Package['sbcl'],
  }

  file { "/home/${user}/.sbclrc":
    ensure  => file,
    owner   => $user,
    group   => $user,
    mode    => '0644',
    source  => 'puppet:///modules/dotfiles/sbclrc',
    require => Exec['sbcl/quicklisp/install'],
  }
}
