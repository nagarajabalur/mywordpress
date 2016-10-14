Description
===========
This cookbook does not set up the WordPress blog. You will need to do this manually by going to http://hostname/wp-admin/install.php 

Platform
--------
* centos 6.7

Chef
--------------------
Chef 12.1+


Attribute Parameters
--------------------

#attributes for DB
default['mywordpress']['db']['name'] -- mysql DB name
default['mywordpress']['db']['user'] -- mysql DB user name
default['mywordpress']['db']['root_password'] - Mysql DB root user password
default['mywordpress']['db']['password'] - Mysql DB user password

#attributes for wordpress 
default['wordpress']['version'] - wordpress version to be installed on the node
default['wordpress']['url'] - url to download wordpress tar ball
