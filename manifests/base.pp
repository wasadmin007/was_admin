class was_admin::base(
$user 		= $was_admin::params::user,
$group		= $was_admin::params::group
) inherits was_admin::params { 

$dirs = [ 
	"$base_dir", 
	'/var/ibm',
        "${base_dir}/${instance_name}" 
	 ]
exec { '/var/ibm':
 command => "cp -r /opt/IBM/var/ibm /var/ ",
 path    => ['/usr/sbin','/usr/bin','/bin'],
 require => Class['ibm_installation_manager']
}

file { $dirs:
     ensure => directory,
     owner  => $user,
     group  => $group,
  }

class { 'websphere':
    user     => $user,
    group    => $group,
    base_dir => $base_dir,
    manage_user => $manage_user,
    manage_group => $manage_group,
  }
}
