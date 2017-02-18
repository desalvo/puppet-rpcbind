class rpcbind::params {
   case $::osfamily {
      'RedHat': {
           case $operatingsystem {
               'Fedora': {
                   $rpcbind_package = "rpcbind"
                   $rpcbind_service = "rpcbind"
                   $rpcbind_enable  = true
               }
               default: {
                   if ($operatingsystemmajrelease * 1 < 6) {
                       $rpcbind_package = "portmap"
                       $rpcbind_service = "portmap"
                       $rpcbind_enable  = true
                   } else {
                       $rpcbind_package = "rpcbind"
                       $rpcbind_service = "rpcbind"
                       if ($operatingsystemmajrelease * 1 > 6) {
                           $rpcbind_enable = false
                       } else {
                           $rpcbind_enable = true
                       }
                   }
               }
           }
       }
      'Suse': {
           case $::operatingsystem {
               'OpenSuSE': {
                   $rpcbind_package = "rpcbind"
                   $rpcbind_service = "rpcbind"
                   $rpcbind_enable  = true
               }
               default: {	# SLE[SD]
                   if ($::lsbmajdistrelease < 11) {
                       $rpcbind_package = "portmap"
                       $rpcbind_service = "portmap"
                   } else {
                       $rpcbind_package = "rpcbind"
                       $rpcbind_service = "rpcbind"
                   }
                   $rpcbind_enable = true
               }
           }
       }
       'Debian': {
           $rpcbind_package = "rpcbind"
           $rpcbind_service = "rpcbind"
           $rpcbind_enable  = true
       }
       default: {
           fail("rpcbind supports osfamilies RedHat, Suse, and Debian. Detected osfamily is ${::osfamily}")
       }
   }
}
