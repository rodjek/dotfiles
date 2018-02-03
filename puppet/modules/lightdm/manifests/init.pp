class lightdm(
  String $greeter_session = 'lightdm-gtk-greeter',
) {
  $packages = [
    'lightdm',
    'lightdm-gtk-greeter',
    'accountsservice',
  ]

  package { $packages: }

  augeas { 'lightdm.conf/global/greeter-session':
    context => '/files/etc/lightdm/lightdm.conf',
    changes => "set Seat:*/greeter-session ${greeter_session}",
    lens    => 'Lightdm.lns',
    incl    => '/etc/lightdm/lightdm.conf',
    require => Package[$packages],
  }

  service { 'lightdm':
    ensure => running,
    enable => true,
  }
}
