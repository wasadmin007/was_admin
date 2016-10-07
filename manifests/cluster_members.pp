class was_admin::cluster_members(
 $cluster_members   = $was_admin::params::cluster_members,
) inherits was_admin::params
{

 create_resources(websphere::cluster::member, $clustermembers)

}
