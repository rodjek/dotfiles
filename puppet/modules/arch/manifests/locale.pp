class arch::locale(
  String $lang = "en_US.UTF-8",
) {
  augeas { 'locale.conf/LANG':
    context => '/files/etc/locale.conf',
    changes => "set LANG ${lang}",
    lens    => 'Shellvars.lns',
    incl    => '/etc/locale.conf',
  }
}
