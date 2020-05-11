Puppet::Functions.create_function(:'dotfiles::load_yaml') do
  dispatch :load_yaml do
    param 'String', :path
  end

  def load_yaml(path)
    Puppet::Util::Yaml.safe_load_file(path)
  end
end
