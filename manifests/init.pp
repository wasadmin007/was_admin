# Class: was_admin
# ===========================
#
# Full description of class was_admin here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'was_admin':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class was_admin (
  $base_dir     = $was_admin::params::base_dir,
  $user         = $was_admin::params::user,
  $group        = $was_admin::params::group,
  $user_home    = $was_admin::params::user_home,
  $dmgrs	= $was_admin::params::dmgrs,
  $mounts       = $was_admin::params::mounts,
  $nodes	= $was_admin::params::nodes,
)inherits was_admin::params
{


   #class {'was_admin::wasgroup': } ->
   #class {'was_admin::wasuser': } ->
   class {'was_admin::mounts': } ->
   class {'was_admin::base':}  ->
   class {'was_admin::install': }
#   class {'was_admin::fixpack': }
 if $::fqdn =~ /dmgr/ { 
   class{'was_admin::dmgr': }
 }
 if $::fqdn =~ /node01/ {
   class{'was_admin::node': } 
  }
   class {'was_admin::clusters': } ->
   class {'was_admin::cluster_members': }
 
}

