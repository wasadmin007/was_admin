class was_admin::install(
$instance_name = $was_admin::params::instance_name,
$instance_base = $was_admin::params::instance_base,
$base_dir     =  $was_admin::params::base_dir,
$user         =  $was_admin::params::user,
$group 	      =  $was_admin::params::group
 ) inherits was_admin::params
{

   websphere::instance {"$instance_name":
      target  => "$instance_base",
      package => 'com.ibm.websphere.ND.v85',
      version => '8.5.5000.20130514_1044',
      profile_base => "$profile_base",
      repository   => '/prodimages/WAS8.5ND/WASND/repository.config',
      require      => Class['Ibm_installation_manager'],
      user         => $user,
      group        => $group 

   } 
}

