class arch::vconsole(
  String $keymap,
) {

  augeas { 'vconsole/KEYMAP':
    context => '/files/etc/vconsole.conf',
    changes => "set KEYMAP ${keymap}",
    lens    => 'Shellvars.lns',
    incl    => '/etc/vconsole.conf',
  }
}
