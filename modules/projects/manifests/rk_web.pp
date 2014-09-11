class projects::rk_web {

  boxen::project { 'rk_web':
    source     => 'FitnessKeeper/web',
  }

  file { '/usr/local/bin/patchHostgroup':
    ensure => 'link',
    target => "/Users/${boxen_user}/.dotfiles/bin/patchHostgroup",
  }

  package { 'pgcli':
    ensure => 'latest',
  }
}
