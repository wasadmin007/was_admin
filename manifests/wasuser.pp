class was_admin::wasuser(
$user = $was_admin::params::user,
$user_home =$was_admin::params::user_home,
)inherits was_admin::params
{
   file {"$user_home":
     ensure => directory,
     owner   => $user,
     group  => $group,
   } 

  user { "$user":
  ensure               => present,
  comment              => "$user created for websphere" ,
  gid                  => 1001, 
  groups               => $group, 
  home                 => $user_home, 
  uid                  => 1002, 
}
}
