class msmtp(
  $user = $facts['ruid'],
) {
  include gnupg

  package { 'msmtp': }

  file { "/home/${user}/.msmtp":
    ensure => directory,
    owner  => $user,
    group  => $user,
    mode   => '0755',
  }

  file { "/home/${user}/.msmtprc":
    ensure => file,
    owner  => $user,
    group  => $user,
    mode   => '0600',
    source => 'puppet:///modules/dotfiles/msmtprc',
  }
}
