# hash  , tile is
# dmgrs = { profile_name  =>  {
#           node_name => 'dmgr',
#           ...
#            ...     
#         }
#
class was_admin::dmgr(
$dmgrs = $was_admin::params::dmgrs,
$cell  = $was_admin::params::cell,
$dmgr  = $::fqdn
) inherits was_admin::params {


#  $instance_base,
#  $cell,
#  $node_name,
#  $profile_base            = undef,
#  $profile_name            = $title,
#  $user                    = $::websphere::user,
#  $group                   = $::websphere::group,
#  $dmgr_host               = $::fqdn,
#  $template_path           = undef,
#  $options                 = undef,
#  $manage_service          = true,
#  $manage_sdk              = false,
#  $sdk_name                = undef,
#  $collect_nodes           = true,
##  $collect_web_servers     = true,
#  $collect_jvm_logs        = true,
#  $wsadmin_user            = undef,
#  $wsadmin_pass            = undef,
  

  create_resources( websphere::profile::dmgr,$dmgrs )
}
