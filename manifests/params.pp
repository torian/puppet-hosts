
class hosts::params {

  case $::operatingsystem {
      
    /^(?i:Debian|Ubuntu)/: {
      $hostsfile = '/etc/hosts'
      $owner     = 'root'
      $group     = 'root'
    }
        
    /^(?i:Redhat|CentOS|fedora)/: {
      $hostsfile = '/etc/hosts'
      $owner     = 'root'
      $group     = 'root'
    }

    /^(OVS|OEL)/: {
      $hostsfile = '/etc/hosts'
      $owner     = 'root'
      $group     = 'root'
    }
        
    /^(?i:OpenSuSE|SLES)/: {
      $hostsfile = '/etc/hosts'
      $owner     = 'root'
      $group     = 'root'
    }

    default: {
      fail("Operating system ${::operatingsystem} not supported yet")
    }
  }
}

