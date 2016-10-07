class was_admin::fixpack(
  $instance_name = $was_admin::params::instance_name,
  $instance_base = $was_admin::params::instance_base,
  $base_dir      =  $was_admin::params::base_dir,
  $user          =  $was_admin::params::user,
  $group 	 =  $was_admin::params::group
 ) inherits was_admin::params
{
   websphere::package {"${instance_name}_fix":
      target       => "${instance_base}",
      package      => 'com.ibm.websphere.ND.v85',
      version      => '8.5.5004.20141119_1746',
      repository   => '/prodimages/WAS8.5ND/WASND/FIX4/repository.config',
      require      => Class["Was_admin::install(stop = true)"],
      user         => $user,
      group        => $group 
   } 
}

