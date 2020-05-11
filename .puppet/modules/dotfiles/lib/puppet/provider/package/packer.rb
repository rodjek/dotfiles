require 'puppet/provider/package'
require 'puppet/provider/package/pacman'

Puppet::Type.type(:package).provide(:packer, :parent => :pacman, :source => :pacman) do
  desc <<~DESC
    Override the upstream pacman provider to use the packer wrapper script that
    adds transparent support for AUR packages.
  DESC

  commands :packer => File.join(Facter.value(:dotfiles_homedir), '.bin', 'packer')

  defaultfor :operatingsystem => :archlinux
  has_feature :install_options
  has_feature :uninstall_options
  has_feature :upgradeable
  has_feature :virtual_packages

  def pacman(*args)
    packer(*args)
  end
end
