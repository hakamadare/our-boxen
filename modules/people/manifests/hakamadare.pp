class people::hakamadare {

  # Ruby/rbenv
  # $default_ruby = '2.0.0-p648'
  $default_ruby = '2.1.8'

  class { 'ruby::global': version => $default_ruby }

  # ruby::gem { "fzf for ${default_ruby}":
  #   ensure  => 'present',
  #   gem     => 'fzf',
  #   ruby    => $default_ruby,
  #   require => Package['the_silver_searcher','pt'],
  # }
  #
  # ruby::gem { "rhc for ${default_ruby}":
  #   ensure => 'present',
  #   gem    => 'rhc',
  #   ruby   => $default_ruby,
  #   before => Homebrew::Tap['homebrew/games'],
  # }

  # Perl/plenv
  # class { 'perl::global':
  #   version => '5.16.2',
  # }
  #
  # perl::plugin { 'plenv-contrib':
  #   ensure => 'present',
  #   source => 'miyagawa/plenv-contrib',
  # }
  #
  # perl::plugin { 'plenv-update':
  #   ensure => 'present',
  #   source => 'dayflower/plenv-contrib',
  # }

  # Python/pyenv
  $default_python = 'system'
  $pythons = [ '2.7.8' ]
  # python::version { $pythons: }

  # class { 'python::global':
  #   version => $default_python,
  # }
  #
  # python::plugin { 'pyenv-virtualenvwrapper':
  #   ensure => 'master',
  #   source => 'yyuu/pyenv-virtualenvwrapper',
  # }
  #
  # python::plugin { 'pyenv-which-ext':
  #   ensure => 'master',
  #   source => 'yyuu/pyenv-which-ext',
  # }
  #
  # python::package { "flake8 for ${default_python}":
  #   package => 'flake8',
  #   python  => $default_python,
  # }
  #
  # python::package { "nose for ${default_python}":
  #   package => 'nose',
  #   python  => $default_python,
  # }
  #
  # python::package { "pygit2 for ${default_python}":
  #   package => 'pygit2',
  #   python  => $default_python,
  #   require => Package['libgit2'],
  # }
  #
  # python::package { "skew for ${default_python}":
  #   package => 'skew',
  #   python  => $default_python,
  # }

  # Dotfiles

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    ensure   => 'master',
    source   => 'hakamadare/dotfiles',
    provider => 'git',
  } ->
  file { "${home}/.ammonite":
    ensure => 'link',
    target => "${dotfiles}/ammonite",
  } ->
  file { "${home}/.profile":
    ensure => 'link',
    target => "${dotfiles}/bash/profile",
  } ->
  file { "${home}/.inputrc":
    ensure => 'link',
    target => "${dotfiles}/readline/inputrc",
  } ->
  file { "${home}/.sshrc":
    ensure => 'link',
    target => "${dotfiles}/sshrc/sshrc",
  } ->
  file { "${home}/.sshrc.d":
    ensure => 'link',
    target => "${dotfiles}/sshrc/sshrc.d",
  } ->
  file { "${home}/.config":
    ensure => 'directory',
    mode   => '0755',
  } ->
  file { "${home}/.config/powerline":
    ensure => 'link',
    target => "${dotfiles}/config/powerline",
  } ->
  file { "${home}/.dsh":
    ensure => 'link',
    target => "${dotfiles}/dsh",
  } ->
  file { "${home}/.gitignore_global":
    ensure => 'absent',
  } ->
  file { "${home}/.perldb":
    ensure => 'link',
    target => "${dotfiles}/perl/perldb",
  } ->
  file { "${home}/.vim":
    ensure => 'directory',
    mode   => '0750',
  } ->
  file { "${home}/.vim/after":
    ensure => 'link',
    target => "${dotfiles}/vim/after",
    force  => true,
  } ->
  file { "${home}/.vim/bundle":
    ensure => 'link',
    target => "${dotfiles}/vim/bundle",
    force  => true,
  } ->
  file { "${home}/.vim/bundle/powerline":
    ensure => 'absent',
  } ->
  file { "${home}/.vim/templates":
    ensure => 'link',
    target => "${dotfiles}/vim/templates",
    force  => true,
  } ->
  file { "${home}/.vim/tmp":
    ensure => 'directory',
    mode   => '0750',
  } ->
  file { "${home}/.vim/doc":
    ensure => 'directory',
    mode   => '0750',
  } ->
  file { "${home}/.vim/vimrc":
    ensure => 'link',
    target => "${dotfiles}/vim/vimrc",
  } ->
  file { "${home}/.vim/gvimrc":
    ensure => 'link',
    target => "${dotfiles}/vim/gvimrc",
  } ->
  file { "${home}/.vimrc":
    ensure => 'link',
    target => "${home}/.vim/vimrc",
  } ->
  file { "${home}/.gvimrc":
    ensure => 'link',
    target => "${home}/.vim/gvimrc",
  } ->
  file { "${home}/.config/nvim":
    ensure => 'link',
    target => "${home}/.vim",
  } ->
  file { "${home}/.puppet-lint.rc":
    ensure => 'link',
    target => "${dotfiles}/puppet/puppet-lintrc",
  } ->
  file { "${home}/.puppet-lintrc":
    ensure => 'absent',
  } ->
  file { "${home}/.tmux.conf":
    ensure => 'link',
    target => "${dotfiles}/tmux/tmux.conf",
  }

  # Packages

  package { 'ammonite-repl':
    ensure   => 'latest',
  }
  package { 'aspell':
    ensure          => 'latest',
    install_options => [
      '--with-lang-en',
    ],
  } ->
  package { 'weechat':
    ensure          => 'absent',
    install_options => [
      '--with-aspell',
      '--with-lua',
      '--with-perl',
      '--with-python',
      '--with-ruby',
    ],
  }

  # package { 'aptly':
  #   ensure   => 'latest',
  # }
  package { 'ansible':
    ensure   => 'absent',
  }
  package { 'augeas':
    ensure   => 'latest',
  }
  package { 'autoenv':
    ensure   => 'latest',
  }
  package { 'awscli':
    ensure   => 'latest',
  }
  package { 'aws-keychain':
    ensure   => 'latest',
  }
  package { 'bcrypt':
    ensure   => 'latest',
  }
  package { 'berkeley-db':
    ensure          => 'latest',
    install_options => [
      '--enable-sql',
    ],
  }
  package { 'bitrise':
    ensure   => 'latest',
  }
  package { 'blink1':
    ensure   => 'latest',
  }
  package { 'bmon':
    ensure   => 'latest',
  }
  package { 'brew-pip':
    ensure   => 'absent',
  }
  package { 'byobu':
    ensure  => 'latest',
    require => Class['tmux'],
  }
  package { 'carina':
    ensure   => 'latest',
  }
  package { 'ccat':
    ensure   => 'latest',
  }
  package { 'certbot':
    ensure   => 'absent',
  }
  package { 'certigo':
    ensure   => 'latest',
  }
  package { 'colordiff':
    ensure   => 'latest',
  }
  package { 'colormake':
    ensure   => 'latest',
  }
  package { 'colortail':
    ensure   => 'latest',
  }
  package { 'commonmark':
    ensure   => 'latest',
  }
  package { 'conjure-up':
    ensure   => 'latest',
  }
  package { 'couchdb':
    ensure   => 'latest',
  }
  package { 'ctags':
    ensure   => 'latest',
  }
  package { 'direnv':
    ensure  => 'latest',
  }
  # package { 'dockertoolbox':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }
  package { 'docker-clean':
    ensure  => 'latest',
  }
  package { 'docker-cloud':
    ensure  => 'absent',
  }
  package { 'docker-machine':
    ensure  => 'absent',
    # before  => Package['dockertoolbox'],
  }
  package { 'doitlive':
    ensure   => 'latest',
  }
  package { 'duck':
    ensure   => 'latest',
  }
  package { 'diff-so-fancy':
    ensure   => 'latest',
  }
  package { 'discount':
    ensure   => 'latest',
  }
  package { 'dnstracer':
    ensure   => 'latest',
  }
  package { 'dos2unix':
    ensure   => 'latest',
  }
  # package { 'dropbox':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }
  package { 'duply':
    ensure   => 'absent',
  }
  package { 'ettercap':
    ensure          => 'latest',
    install_options => [
      '--with-ghostscript',
      '--with-ipv6',
      '--with-luajit',
    ],
  }
  package { 'ephemeralpg':
    ensure  => 'latest',
  }
  package { 'fig':
    ensure  => 'absent',
    # before  => Package['dockertoolbox'],
  }
  package { 'fasd':
    ensure   => 'latest',
  }
  package { 'fzf':
    ensure   => 'latest',
  }
  package { 'ghostscript':
    ensure   => 'latest',
  }
  package { 'ghq':
    ensure   => 'latest',
  }
  package { 'gibo':
    ensure   => 'latest',
  }
  package { 'gifsicle':
    ensure   => 'latest',
  }
  package { 'git-flow':
    ensure   => 'latest',
  }
  package { 'git-lfs':
    ensure  => 'latest',
    require => Package['git'],
  }
  package { 'git-town':
    ensure   => 'latest',
  }
  package { 'giter8':
    ensure   => 'latest',
  }
  package { 'gitter':
    ensure   => 'present',
    provider => 'brewcask',
  }
  package { 'goenv':
    ensure   => 'latest',
  }
  package { 'graphicsmagick':
    ensure          => 'absent',
    install_options => [
      '--with-freetype',
      '--with-ghostscript',
      '--with-jasper',
      '--with-libpng',
      '--with-libtiff',
      '--with-libwmf',
      '--with-little-cms',
      '--with-little-cms2',
      '--with-perl',
      '--with-quantum-depth=32',
      '--with-svg',
    ]
  }
  package { 'gron':
    ensure   => 'latest',
  }
  package { 'haproxy':
    ensure   => 'absent',
  }
  package { 'haskell-stack':
    ensure   => 'absent',
  }
  package { 'htop':
    ensure   => 'latest',
  }
  package { 'hugo':
    ensure   => 'latest',
  }
  package { 'h2o':
    ensure   => 'latest',
  }
  package { 'iftop':
    ensure   => 'latest',
  }
  package { 'imagemagick':
    ensure          => 'absent',
    install_options => [
      '--enable-hdri',
      '--with-freetype',
      '--with-fontconfig',
      '--with-ghostscript',
      '--with-jasper',
      '--with-jp2',
      '--with-liblqr',
      '--with-libpng',
      '--with-librsvg',
      '--with-libtiff',
      '--with-libwmf',
      '--with-little-cms',
      '--with-little-cms2',
      '--with-openexr',
      '--with-perl',
      '--with-quantum-depth=32',
      '--with-svg',
      '--with-webp',
    ]
  }

  package { 'insect':
    ensure   => 'latest',
  }

  package { 'ipcalc':
    ensure   => 'latest',
  }

  package { 'oniguruma':
    ensure   => 'latest',
  } ->
  package { 'jq':
    ensure   => 'latest',
  }

  package { 'karn':
    ensure   => 'latest',
  }
  package { 'keybase':
    ensure   => 'present',
    provider => 'brewcask',
  }
  package { 'kitchen-sync':
    ensure   => 'latest',
    install_options => [ '--with-mysql', '--with-postgresql' ],
  }
  package { 'launch':
    ensure   => 'latest',
  }
  package { 'lesspipe':
    ensure          => 'latest',
    install_options => [ '--syntax-highlighting' ],
  }
#   package { 'monkeysphere': provider => 'homebrew' }
  package { 'libconfig':
    ensure   => 'latest',
  }
  package { 'libgit2':
    ensure   => 'latest',
  }
  package { 'libssh2':
    ensure   => 'latest',
  }
  package { 'lft':
    ensure   => 'latest',
  }
  package { 'liboping':
    ensure   => 'latest',
  }
  package { 'logstalgia':
    ensure   => 'latest',
  }
  package { 'lua':
    ensure   => 'latest',
  }
  package { 'mackup':
    ensure   => 'latest',
  }
  package { 'mitmproxy':
    ensure   => 'absent',
  }
  package { 'mobile-shell':
    ensure   => 'latest',
  }
  package { 'mutt':
    ensure   => 'latest',
  }
  package { 'nmap':
    ensure   => 'latest',
  }
  package { 'no-more-secrets':
    ensure   => 'latest',
  }
  package { 'nomad':
    ensure   => 'latest',
  }
  package { 'noti':
    ensure   => 'latest',
  }
  # package { 'onyx':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }
  package { 'otto':
    ensure   => 'latest',
  }
  package { 'packer':
    ensure => 'latest',
  } ->
  package { 'packer-completion':
    ensure => 'latest',
  }
  package { 'parallel':
    ensure => 'latest',
  }
  package { 'pcre':
    ensure => 'latest',
  }
  package { 'pdsh':
    ensure   => 'latest',
  }
  package { 'peco':
    ensure   => 'absent',
  }
  package { 'pgformatter':
    ensure   => 'latest',
  }
  package { 'pgtoolkit':
    ensure   => 'latest',
  }
  $pianobar_deps = [ 'faac', 'ffmpeg', 'lame', 'x264', 'xvid' ]
  package { $pianobar_deps:
    ensure   => 'latest',
  } ->
  package { 'pianobar':
    ensure   => 'latest',
  }
  package { 'pngcrush':
    ensure   => 'latest',
  }
  package { 'ruby-install':
    ensure   => 'latest',
  }
  package { 'the_platinum_searcher':
    ensure   => 'latest',
  }
  package { 'tunnelbear':
    ensure   => 'present',
    provider => 'brewcask',
  }
  package { 'plenv':
    ensure   => 'latest',
  } ->
  package { 'perl-build':
    ensure   => 'latest',
  }
  package { 'png2ico':
    ensure   => 'latest',
  }
  package { 'powerline':
    ensure   => 'absent',
  } ->
  package { 'powerline-status':
    provider => 'pip',
    ensure   => '2.6',
  }
  # package { 'postico':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }
  package { 'prettyping':
    ensure   => 'latest',
  }
  package { 'prips':
    ensure   => 'latest',
  }
  package { 'cv':
    ensure   => 'latest',
  }
  package { 'pwgen':
    ensure   => 'latest',
  }
  package { 'pv':
    ensure   => 'latest',
  }
  package { 'pyenv':
    ensure   => 'latest',
  } ->
  package { 'pyenv-pip-migrate':
    ensure   => 'latest',
  } ->
  package { 'pyenv-which-ext':
    ensure   => 'latest',
  } ->
  package { 'pyenv-virtualenv':
    ensure   => 'latest',
  }
  # package { 'qlcolorcode':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }
  # package { 'qlmarkdown':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }
  # package { 'qlprettypatch':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }
  package { 'rethinkdb':
    ensure   => 'absent',
  }
  package { 'rrdtool':
    ensure          => 'latest',
    install_options => [ '--with-lua' ],
  }
  package { 'scalastyle':
    ensure   => 'latest',
  }
  package { 'shellcheck':
    ensure   => 'latest',
  }
  package { 'slackcat':
    ensure   => 'latest',
  }
  package { 'socat':
    ensure   => 'latest',
  }
  package { 'sox':
    ensure          => 'latest',
    install_options => [ '--with-flac', '--with-lame', '--with-libao', '--with-libsndfile', '--with-libvorbis', '--with-opencore-amr', ],
  }
  package { 'sshrc':
    ensure   => 'latest',
  }
  package { 'sslmate':
    ensure   => 'latest',
  }
  package { 'sslscan':
    ensure   => 'latest',
  }
  package { 'stormssh':
    ensure   => 'latest',
  }
  package { 'task':
    ensure   => 'latest',
  }
  package { 'terraform':
    ensure   => 'absent',
  }
  package { 'thefuck':
    ensure   => 'latest',
  }
  package { 'the_silver_searcher':
    ensure   => 'latest',
  }
  package { 'thrift':
    ensure          => 'absent',
    install_options => [
      '--with-java',
      '--with-libevent',
      '--with-perl',
      '--with-python',
    ],
  }
  package { 'tidyp':
    ensure   => 'latest',
  }
  package { 'tree':
    ensure   => 'latest',
  }
  package { 'unpaper':
    ensure   => 'latest',
  }
  package { 'vimpager':
    ensure   => 'latest',
  }
  package { 'watch':
    ensure   => 'latest',
  }
  package { 'wtf':
    ensure   => 'latest',
  }
  package { 'wireshark':
    ensure   => 'present',
    provider => 'brewcask',
  }
  package { 'xhyve':
    ensure   => 'latest',
  } ->
  package { 'docker-machine-driver-xhyve':
    ensure          => 'absent',
    install_options => [
      '--without-docker-machine',
    ],
  }
  package { 'yubikey-piv-manager':
    ensure   => 'present',
    provider => 'brewcask',
  }

  # Homebrew Cask
  package { 'hr':
    ensure => 'latest',
  } ->
  package { 'vitorgalvao/tiny-scripts/cask-repair':
    ensure => 'latest',
  }

  # tflint
  homebrew::tap { 'wata727/tflint': } ->

  package { 'tflint':
    ensure          => 'latest',
    install_options => [
      '--without-terraform',
      '--with-tfenv',
    ],
  }

  # Cloud Foundry
  $cloudfoundry_utils = ['cf-cli','bosh-init']
  homebrew::tap { 'cloudfoundry/tap': } ->

  package { $cloudfoundry_utils:
    ensure => 'latest',
  }


  # Dinghy
  homebrew::tap { 'codekitchen/dinghy': } ->

  package { 'dinghy':
    ensure => 'absent',
  }

  # Neovim
  package { 'msgpack':
    ensure => 'latest',
  } ->

  package { 'neovim':
    ensure => 'latest',
  }

  package { 'vimr':
    provider => 'brewcask',
    ensure   => 'present',
  }

  homebrew::tap { 'homebrew/binary': }

  package { 'bash-completion':
    ensure => 'absent',
  } ->
  package { 'bash-completion@2':
    ensure => 'latest',
  }

  package { 'brew-cask-completion':
    ensure => 'latest',
  } ->
  package { 'bundler-completion':
    ensure => 'latest',
  } ->
  package { 'docker-completion':
    ensure => 'absent',
  } ->
  package { 'docker-compose-completion':
    ensure => 'latest',
  } ->
  package { 'docker-machine-completion':
    ensure => 'latest',
  } ->
  package { 'gem-completion':
    ensure => 'latest',
  } ->
  package { 'launchctl-completion':
    ensure => 'installed',
  } ->
  package { 'pip-completion':
    ensure => 'installed',
  } ->
  package { 'rake-completion':
    ensure => 'latest',
  } ->
  package { 'ruby-completion':
    ensure => 'latest',
  } ->
  package { 'stormssh-completion':
    ensure => 'installed',
  }

  homebrew::tap { 'homebrew/games': } ->
  package { 'abuse':
    ensure   => 'latest',
  } ->
  package { 'dwarf-fortress':
    provider => 'brewcask',
    ensure   => 'absent',
  } ->
  package { 'frotz':
    ensure   => 'latest',
  } ->
  package { 'mame':
    ensure   => 'latest',
  } ->
  package { 'stone-soup':
    ensure   => 'latest',
  }

  homebrew::tap { 'docmunch/pdftk': } ->
  package { 'pdftk':
    ensure => 'absent',
  }

  # package { 'flashlight':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }

  # package { 'quicksilver':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }

  # package { 'reggy':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }

  # package { 'spectacle':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }

  homebrew::tap { 'ravenac95/sudolikeaboss': } ->
  package { 'sudolikeaboss':
    ensure => 'latest',
  }

  # NodeJS
  $nodenv = '5.6.0'
  Npm_module { node_version => $nodenv }

  class { 'nodejs::global': version                 => $nodenv }
  # class { 'nodejs::global': version                 => $nodenv } ->
  # npm_module { 'json-minify': module                => 'json-minify' } ->
  # npm_module { 'jsonlint': module                   => 'jsonlint' } ->
  # npm_module { 'minify': module                     => 'minify' } ->
  # npm_module { 'node-json-minify': module           => 'node-json-minify' } ->
  # npm_module { 'uglify-js': module                  => 'uglify-js' } ->
  # npm_module { 'yo': module                         => 'yo' } ->
  # npm_module { 'bower': module                      => 'bower' } ->
  # npm_module { 'grunt-cli': module                  => 'grunt-cli' } ->
  # npm_module { 'gulp': module                       => 'gulp' } ->
  # npm_module { 'generator-webapp': module           => 'generator-webapp' } ->
  # npm_module { 'generator-skinny': module           => 'generator-skinny' } ->
  # npm_module { 'generator-angular-scalatra': module => 'generator-angular-scalatra' }

  # Apps

  # package { 'bartender':
  #   ensure   => 'present',
  #   provider => 'brewcask',
  # }

  class { 'adium': }
  class { 'atom': }
  class { 'bash': }
  # class { 'calibre': }
  class { 'cathode': }
  class { 'charles': }
  class { 'chrome': }
  class { 'colloquy': }
  class { 'cord': }
  # class { 'cyberduck': }
  # class { 'diskmakerx': }
  # class { 'docker':
  #   ensure => 'absent',
  #   before => Package['dockertoolbox'],
  # }
  class { 'dterm': }
  class { 'firefox': }
  class { 'fluid': }
  class { 'flux': }
  class { 'git': }
  # class { 'github_for_mac': }
  class { 'googleearth': }
  # class { 'gpgtools': }
  # class { 'handbrake': }
  class { 'heroku': }
  # class { 'iterm2::dev': } ->
  # class { 'iterm2::colors::solarized_dark': } ->
  # class { 'iterm2::colors::solarized_light': } ->
  # class { 'java': }
  # class { 'jq': }
#  class { 'libreoffice': }
  # class { 'league_of_legends::na': }
  class { 'knock': }
  class { 'lingon': }
  # class { 'moom': }
  class { 'mumble': }
  class { 'notational_velocity::nvalt': }
#  class { 'omnigraffle': }
  class { 'packer':
    ensure => 'absent',
    before => Package['packer'],
  }
  class { 'pgadmin3': }
  class { 'postbox': }
  class { 'senuti': }
  class { 'sequel_pro': }
  class { 'skype': }
  class { 'slate': }
  class { 'spotify': }
  class { 'steam': }
  class { 'trackballworks': }
  class { 'tmux': }
#  class { 'utorrent': }
  class { 'xz': }

  # OS X customizations

  class { 'osx::finder::show_all_on_desktop': }
  class { 'osx::finder::enable_quicklook_text_selection': }
  class { 'osx::no_network_dsstores': }
  class { 'osx::global::natural_mouse_scrolling': enabled => false }

  # Guardian Angel needs zero delay
  boxen::osx_defaults { 'zero delay for password dialog on screensaver':
    ensure  => present,
    domain  => 'com.apple.screensaver',
    key     => 'askForPasswordDelay',
    value   => 0,
    user    => $::boxen_user,
    require => Class['boxen::security'],
  }

  # sudo privileges for toggleBoxen.sh
  sudoers { 'toggleBoxen-shuff':
    users    => 'shuff',
    hosts    => 'ALL',
    commands => [
      "(ALL) NOPASSWD : /Users/shuff/.dotfiles/bin/toggleBoxen.sh",
    ],
    type     => 'user_spec',
  }

  sudoers { 'toggleBoxen-rk':
    users    => 'rk',
    hosts    => 'ALL',
    commands => [
      "(ALL) NOPASSWD : /Users/rk/.dotfiles/bin/toggleBoxen.sh",
    ],
    type     => 'user_spec',
  }

  # sudo privileges for rebootWindows.sh
  sudoers { 'rebootWindows':
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => [
      "(ALL) NOPASSWD : /Users/${::boxen_user}/.dotfiles/bin/rebootWindows.sh",
    ],
    type     => 'user_spec',
  }

  # scala
  class { 'projects::rk_scala': }

  if $::boxen_user == 'rk' {
    class { 'projects::rk_web': }

    file { "${home}/.config/RunKeeper":
      ensure => 'directory',
      mode   => '0640',
    }

    file { '/usr/local/rk':
      ensure => 'link',
      target => '/usr/local/RunKeeper',
      force  => true,
    } ->
    file { '/usr/local/RunKeeper':
      ensure => 'directory',
      owner  => 'root',
      group  => 'wheel',
      mode   => '0644',
    }

    file { '/usr/local/RunKeeper/etc':
      ensure => 'directory',
      owner  => 'root',
      group  => 'wheel',
      mode   => '0644',
    }

    file { '/usr/local/RunKeeper/lib':
      ensure => 'directory',
      owner  => 'root',
      group  => 'wheel',
      mode   => '0644',
    }

    file { '/usr/local/RunKeeper/lib/perl':
      ensure => 'link',
      target => "/Users/${::boxen_user}/git/devops-puppet/modules/runkeeper/files/filesys/lib/perl",
    }
  }
}
