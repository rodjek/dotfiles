require 'puppet/provider/package'

Puppet::Type.type(:package).provide(:yaourt, :parent => Puppet::Provider::Package) do
  desc 'yaourt (AUR) package provider'
  commands :yaourt => 'yaourt'
  confine :operatingsystem => :archlinux
  has_feature :upgradeable

  def self.listcmd
    [command(:yaourt, '-Q')]
  end

  def self.instances
    packages = []

    begin
      execpipe(listcmd) do |process|
        fields = [:name, :ensure]

        regex = /^\w+\/(\S+)\s+(\S+)/

        process.each_line do |line|
          hash = {}

          if match = line.match(regex)
            fields.zip(match.captures) do |field, value|
              hash[field] = value
            end

            hash[:provider] = self.name
            packages << new(hash)
          else
            warning('Failed to match line %s' % line)
          end
        end
      end
    rescue Puppet::ExecutionFailure
      return nil
    end

    return packages
  end

  def install
    yaourt '--noconfirm', '-Sy', @resource[:name]
  end

  def update
    install
  end

  def latest
    yaourt '-Sy'

    yaourt('-Sp', '--print-format %v', @resource[:name]).chomp
  end

  def query
    output = yaourt('-Qi', @resource[:name])

    if output =~ /Version.*?:\s(.+)/
      { :ensure => $1 }
    else
      nil
    end
  rescue Puppet::ExecutionFailure
    return {
      :ensure => :purged,
      :status => 'missing',
      :name => @resource[:name],
      :error => 'ok',
    }
  end

  def uninstall
    yaourt '--noconfirm', '-R', @resource[:name]
end
