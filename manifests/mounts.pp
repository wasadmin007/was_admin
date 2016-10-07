#
#
class was_admin::mounts(
 $mounts = $was_admin::params::mounts,
) inherits was_admin::params
{
  create_resources(was_admin::mount,$mounts)
}
