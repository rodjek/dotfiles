require 'puppet/provider/package'

Puppet::Type.type(:package).provide(:yaourt, :parent => Puppet::Provider::Package) do
  desc 'yaourt (AUR) package provider'
  confine :operatingsystem => :archlinux
  has_feature :upgradeable, :install_options

  def self.yaourt(*args)
    yaourt_bin = Puppet::Util.which('yaourt')
    Puppet::Util::Execution.execute(
      [yaourt_bin, *args],
      :uid => run_as_user,
      :gid => run_as_user,
      :failonfail => true,
      :custom_environment => {
        'HOME' => run_as_user.nil? ? '/root' : "/home/#{run_as_user}",
        'PATH' => '/sbin:/bin:/usr/sbin:/usr/bin',
      },
    )
  end

  def yaourt(*args)
    self.class.yaourt(*args)
  end

  def self.listcmd
    [command(:yaourt), '-Q']
  end

  def self.instances
    packages = []
    regex = /^\w+\/(\S+)\s+(\S+)/
    fields = [:name, :ensure]

    yaourt('-Q').split("\n").each do |line|
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

    packages
  rescue Puppet::ExecutionFailure
    return nil
  end

  def run_as_user
    @run_as_user ||= @resource[:install_options].select { |r|
      r.is_a?(Hash) && r.key?('user')
    }.first['user']
  end

  def self.run_as_user
    nil
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
      :name   => @resource[:name],
      :error  => 'ok',
    }
  end

  def uninstall
    yaourt '--noconfirm', '-R', @resource[:name]
  end
end
