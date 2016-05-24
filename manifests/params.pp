class rpcbind::params {
   case $::osfamily {
      'RedHat': {
           case $operatingsystem {
               'Fedora': {
                   $rpcbind_package = "rpcbind"
                   $rpcbind_service = "rpcbind"
               }
               default: {
                   if ($operatingsystemmajrelease < 6) {
                       $rpcbind_package = "portmap"
                       $rpcbind_service = "portmap"
                   } else {
                       $rpcbind_package = "rpcbind"
                       $rpcbind_service = "rpcbind"
                   }
               }
           }
       }
      'Suse': {
           case $::operatingsystem {
               'OpenSuSE': {
                   $rpcbind_package = "rpcbind"
                   $rpcbind_service = "rpcbind"
               }
               default: {	# SLE[SD]
                   if ($::lsbmajdistrelease < 11) {
                       $rpcbind_package = "portmap"
                       $rpcbind_service = "portmap"
                   } else {
                       $rpcbind_package = "rpcbind"
                       $rpcbind_service = "rpcbind"
                   }
               }
           }
       }
       'Debian': {
           $rpcbind_package = "rpcbind"
           $rpcbind_service = "rpcbind"
       }
       default: {
           fail("rpcbind supports osfamilies RedHat, Suse, and Debian. Detected osfamily is ${::osfamily}")
       }
   }
}
