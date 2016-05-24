puppet-rpcbind
======

Puppet module for setting up rpcbind/portmap services.

#### Table of Contents
1. [Overview - What is the rpcbind module?](#overview)
2. [Usage](#usage)

Overview
--------

This module is a simple configurator for rpcbind/portmap services.

Usage
-----

**Setting up rpcbind**

```rpcbind
class {'rpcbind': }
```

Contributors
------------

* https://github.com/desalvo/puppet-rpcbind/graphs/contributors

Release Notes
-------------

**0.1.3**

* Fix OS detection in params

**0.1.2**

* Add support for Centos 7

**0.1.1**

* Add support for Debian OS family

**0.1.0**

* Initial version
