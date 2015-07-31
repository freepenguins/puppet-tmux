# tmux

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with tmux](#setup)
    * [What tmux affects](#what-tmux-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with tmux](#beginning-with-tmux)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs tmux.

## Module Description

This module installs tmux in an easy way.

## Setup

### What tmux affects

* Will create the file /etc/tmux.conf
* Will create an emty .tmux.conf in all users home dirs for user specific settings

### Setup Requirements

* pluginsync must be enabled (enabled by default in Puppet version 4 and above)

### Beginning with tmux

Just type 'tmux' in the terminal to begin. 
I recommend you to read the tmux man pages for information of how to use tmux.

## Usage

To install tmux:

    class{'::tmux':}

To uninstall tmux:

    class{'::tmux':
      ensure => 'absent',
    }

To set some custom parameters:

    class{'::tmux':
      set_option => ['-g prefix C-a', '-g base-index 1'],
      bind_key   => ['C-a send-prefix', '-t vi-copy "v" begin-selection', '-t vi-copy "y" copy-selection'],
    }

## Reference

This module contains a facter called 'userdirs' and is under the lib/facter folder in the tmux module. It just returns an array of all users home directorys, that is all users that have a home dir under /home.

## Class parameters

* ensure
* set_option
* set_window_option
* bind_key
* set
* unbind_key 


## Limitations

Puppet version 3 or above is required.

## Development

Please se the github page for this module at https://github.com/maxhope/puppet-tmux. 
I would be more than happy if you would contribute with improvements. 
