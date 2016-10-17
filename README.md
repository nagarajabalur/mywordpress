Description
===========
This cookbook does not set up the WordPress blog. You will need to do this manually by going to http://hostname/wp-admin/install.php 

Requirements
============

Platform
--------
* centos 6.7

Cookbooks
---------

* mysql
* mysql_chef_gem


Attributes
==========

### WordPress

* `node['mywordpress']['version']` - Version of WordPress to download. Use 'latest' to download most recent version.
* `node['mywordpress']['db']['root_password']` - Root password for MySQL 
* `node['mywordpress']['db']['name']` - Name of the WordPress MySQL database.
* `node['mywordpress']['db']['user']` - Name of the WordPress MySQL user.
* `node['mywordpress']['db']['password']` - Password of the WordPress MySQL user. 

Usage
=====

Add the "mywordpress" recipe to your node's run list.

License and Author
==================

* Author:: Nagaraj Abalur  (nagaraj.as@reancloud.com)
