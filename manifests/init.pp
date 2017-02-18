class rpcbind inherits rpcbind::params {
   package { $rpcbind::params::rpcbind_package: ensure => latest }
   service { $rpcbind::params::rpcbind_service:
     ensure => running,
     enable => $rpcbind::params::rpcbind_enable,
     require => Package[$rpcbind::params::rpcbind_package]
   }
}
