class was_admin::wasgroup (
$group = $was_admin::params::group,
)inherits was_admin::params{
group {"$group":
  ensure => present,
  gid    => 1001,
}
}
