Puppet hosts Module
===================

Introduction
------------

Manage hosts definitions in the system hosts file

Examples
--------

```puppet
    node mynode.example.com {
      
      class { 'hosts': 
        entries => [ '1.2.3.4 host1.example.com host1', '2.3.4.5 host2.example.com' ]
      }
      
    }
```

Issues
------

  None yet

TODO
----

 * Parameter enable is not very usefull yet
 * Parameter ipv6 is not very usefull yet

CopyLeft
---------

Copyleft (C) 2012 Emiliano Castagnari <ecastag@gmail.com> (a.k.a. Torian)
