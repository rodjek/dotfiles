class xorg::archlinux {
  $packages = [
    'xorg-server',
    'xorg-apps',
    'xorg-xinit',
    'mesa',
    'xf86-video-vesa',
    'xterm',
    'xf86-video-intel',
  ]

  package { $packages: }
}
