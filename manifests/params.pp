# Class tmux::params
class tmux::params {
  $ensure             = 'present'
  $set_option         = ['-g prefix C-a', '-g base-index 1', '-sg escape-time 0', '-g status-bg black', '-g status-fg white']
  $bind_key           = ['C-a send-prefix', 'r source-file ~/.tmux.conf \; display "reloaded tmux.conf"', '-t vi-copy "v" begin-selection', '-t vi-copy "y" copy-selection', 'j select-pane -D', 'k select-pane -U', 'h select-pane -L', 'l select-pane -R']
  $unbind_key         = ['C-o']
  $set_window_option   = ['-g window-status-current-bg yellow', '-g window-status-current-fg black']
  $set                 = []

  case $::osfamily {
    'RedHat', 'ArchLinux': {
      $conf = '/etc/tmux.conf'
    }
    default: { notify{'Module yet not supported for your OS!':}  }
  }
}
