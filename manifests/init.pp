class rpcbind inherits rpcbind::params {
   if (!defined(Package[$rpcbind::params::rpcbind_package])) {
     package { $rpcbind::params::rpcbind_package: ensure => latest }
   }
   if (!defined(Service[$rpcbind::params::rpcbind_service])) {
     service { $rpcbind::params::rpcbind_service:
       ensure => running,
       enable => $rpcbind::params::rpcbind_enable,
       require => Package[$rpcbind::params::rpcbind_package]
     }
   }
}
