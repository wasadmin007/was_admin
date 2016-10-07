class was_admin::node(
$nodes = $was_admin::params::nodes,
$user  = $was_admin::params::user,
$group = $was_admin::params::group,
$cell  = $was_admin::params::cell,
)inherits was_admin::params
{

  File <<| title == '/tmp/praveen' |>>
{
  path  => '/usr/IBM/praveen'

}
  
  create_resources(websphere::profile::appserver,$nodes)
}
