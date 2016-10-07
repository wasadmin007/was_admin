##
##
##
##

class was_admin::service(
  $type,
  $profile_base,
  $profile_name = getvar('websphere_profiles'),
  $user         = "$was_admin::params::user",
  $ensure       = 'running',
  $start        = undef,
  $stop         = undef,
  $status       = undef,
  $restart      = undef,
  $wsadmin_user = "$was_admin::params::wsadmin_user",
  $wsadmin_pass = "$was_admin::params::wsadmin_pass",
)inherits was_admin::params{

	websphere:service { 'websphererestart' :
            type,
 	    profile_base  => $profile_base,
 	    profile_name  => $profile_name,
 	    user          => $user,
 	    ensure        => 'running',
	    start         => $start,
 	    stop          => $stop,
 	    status        => $status,
  	    restart       => $restart,
 	    wsadmin_user  => $wsadmin_user,
	    wsadmin_pass  => $wsadmin_pass,  	
	}
}
