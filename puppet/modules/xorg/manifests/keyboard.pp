class xorg::keyboard(
  $layout  = 'us',
  $model   = 'pc104',
  $variant = '',
  $options = '',
) {
  file { '/etc/X11/xorg.conf.d/00-keyboard.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('xorg/etc/X11/xorg.conf.d/keyboard.conf.erb'),
  }
}
