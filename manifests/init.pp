# == Class: rarpd
#
# This module configures rarpd.
#
# === Parameters
#
# Document parameters here.
#
# [*config_file*]
#   String: path to config file, default: /etc/ethers
#
# [*enable_yplookup*]
#   Boolean: enable yplookup?, default: false
#
# [*service_enable*]
#   Boolean: enable the service?, default: true
#
# [*service_ensure*]
#   Enum[running, stopped]: desired service state, default: "running"
#
# [*service_flags*]
#   String: flags passed to the service, default: "-al"
#
# [*service_name*]
#   String: the name of the service, default: "rarpd"
#
# [*ethers*]
#   Optional Hash: contents that goes into the config file.
#
# === Examples
#
# In the very simplest case, you just include the following:
#
# include rarpd 
#
# Configuration example for Hiera:
#
# rarpd::ethers:
#   node1: "00:11:22:33:44:55"
#
# === Authors
#
# Sebastian Reitenbach <sebastia@l00-bugdead-prods.de>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class rarpd (
  String $config_file,
  Boolean $enable_yplookup,
  Boolean $service_enable,
  Enum[running, stopped, 'running', 'stopped'] $service_ensure,
  String $service_flags,
  String $service_name,
  Optional[Hash] $ethers,
) {
  contain rarpd::config
  contain rarpd::service

  Class['rarpd::config']
  ~> Class['rarpd::service']
}
