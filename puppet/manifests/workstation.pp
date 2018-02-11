include profile::archlinux
include profile::i3
include profile::neovim
include profile::urxvt
include profile::mail
include avahi

include spotify
include sbcl

class { 'bash_it':
  user => 'tsharpe',
}
arch::aur { 'hipchat': }
package { 'pass': }
