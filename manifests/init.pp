# Class: tmux
class tmux(
  $ensure              = $tmux::params::ensure,
  $set_option          = $tmux::params::set_option,
  $set_window_option   = $tmux::params::set_window_option,
  $bind_key            = $tmux::params::bind_key,
  $set                 = $tmux::params::set,
  $unbind_key          = $tmux::params::unbind_key,
) inherits tmux::params {

  if $ensure =~ Enum['present', 'absent'] {
    package {'tmux':
      ensure  => $ensure,
    }
  } else {
    fail('$ensure must be either present or absent!')
  }

  file {$tmux::params::conf:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('tmux/tmux.conf.erb'),
    require => Package['tmux'],
  }

  $userdirs = inline_template("<%= scope.lookupvar('userdirs') %>")

  $dirarray = split($userdirs, ',')
  $dirarray.each |String $dir| {
    file {"${dir}/.tmux.conf":
      ensure  => file,
      path    => "${dir}/.tmux.conf",
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Package['tmux'],
    }
  }
}
