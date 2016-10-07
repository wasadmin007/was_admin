define was_admin::mount(
$device,
$fstype = 'nfs',
) {

exec { "$title":
  command  => "mkdir -p $title",
  path    => ['/bin','/usr/bin','/usr/sbin']

}  

mount { "$title":
	 ensure      => mounted, 
  	 atboot      => true, 
         device      => $device, 
  	 fstype      => $fstype, 
         remounts    => true,
}
}
