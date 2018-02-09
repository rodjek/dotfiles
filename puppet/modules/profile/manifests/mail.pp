class profile::mail {
  class { 'urlview':
    user => 'tsharpe',
  }

  class { 'msmtp':
    user => 'tsharpe',
  }
}
