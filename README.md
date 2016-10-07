Description
===========
This cookbook does not set up the WordPress blog. You will need to do this manually by going to http://hostname/wp-admin/install.php 

Platform
--------
* RHEL/CentOS 5, 6

Cookbooks
---------
* mysql
* mysql_chef_gem
* php
* apache2
* openssl (uses library to generate secure passwords)
* selinux (used to disable selinux for MySQL on RHEL-based systems)
