class was_admin::params(
  $base_dir              = '/usr/IBM',
  $user                  = 'was_admin',
  $group                 = 'was_admin',
  $user_home                = "/home/$user",
  $manage_user   	    = true,
  $manage_group  	    = true,
  $instance_name            = "WebSphere", 
  $instance_base 	    = "${base_dir}/${instance_name}/AppServer",
  $cell          	    = 'Cell01',
  $profile_base             = "${instance_base}/profiles", 
  $wsadmin_user             = 'was_admin',
  $wsadmin_pass             = 'was_admin',
  $dmgr_template_path       = "${instance_base}/profileTemplates/dmgr",
  $node_template_path       = "${instance_base}/profileTemplates/managed",
  $manage_service          = true,
  $soap_port               = '8879',
  $mounts                   = {'/prodimages' => {
                                    device    => 'puppet-master:/prodimages',
                                    fstype    => 'nfs'
                                    },
				},
  $dmgrs                    = {'Dmgr01' => {
                                 instance_base => $instance_base,
                                  cell		=> $cell,
                                  node_name     => 'Dmgr01',
                                  profile_base  => $profile_base,
                                  user		=> $user,
                                  group	  	=> $group,
                                  wsadmin_user  => $wsadmin_user,
                                  wsadmin_pass  => $wsadmin_user,		
                                  manage_service => $manage_service,
				  require        => Class['was_admin::install'],  
                              },
			      },
  $nodes	       	    = {'AppSrv01' => {
                                  instance_base => $instance_base,      
                                  cell          => $cell,       
                                  node_name     => 'AppSrv01',    
                                  profile_base  => $profile_base,       
                                  user          => $user,       
                                  group         => $group,
                                  dmgr_host     => 'ibm-im-was-dmgr01.localdomain',
 				  dmgr_port	=> '8879',
				  template_path => $node_template_path,                                           wsadmin_user  => $wsadmin_user,                                                 wsadmin_pass  => $wsadmin_user,                                                 manage_service => $manage_service,
				  require        => Class['was_admin::install']
 				},

                              },
   $clusters	           = {  'fepocCl01' => {
 						 profile_base => "$profile_base",
  					 	 dmgr_profile => "Dmgr01",
  					 	 cell         => "$cell",
  					 	 require      => Websphere::Profile::Dmgr['Dmgr01'],
			                       },  
 			
			          },

     $clustermembers          =  { 'fepocAppServ01' =>  {
                           	    ensure  =>  'present',
				    profile_base => "$profile_base",
                                    cluster =>  'fepocCl01',
                                    cell    => "$cell",
				    dmgr_profile => 'Dmgr01',
                                    node_name    =>  'AppSrv01', 
                                    jvm_maximum_heap_size   => '512',
                                    jvm_verbose_mode_class  => true,
   			            jvm_verbose_garbage_collection   => false,
                                    total_transaction_timeout  => '120',
                                    client_inactivity_timeout  => '20',
                                    threadpool_webcontainer_max_size => '75',
                                    runas_user         => "$user",  
                                    runas_group        => "$group",                                                },
                                  },

)
{



}
