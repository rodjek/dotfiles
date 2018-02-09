class profile::fonts {
  package { 'terminus-font': }

  package { 'ttf-fantasque-sans-mono':
    provider        => 'yaourt',
    install_options => [{'user' => 'tsharpe'}],
  }
}
