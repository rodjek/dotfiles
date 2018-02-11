class profile::ruby {
  rbenv::install { '2.4.2': }
  rbenv::install { '2.1.9': }
}
