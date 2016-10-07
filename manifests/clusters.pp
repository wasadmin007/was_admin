#
#
#
class was_admin::clusters(
  $clusters  = $was_admin::params::clusters,
)inherits  was_admin::params
{
	create_resources(websphere::cluster, $clusters)
}
