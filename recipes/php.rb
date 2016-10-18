#
# Cookbook Name:: mywordpress
# Recipe:: php
#
# author: Nagaraj Abalur
#
# This recipe will install php packages which are required for WordPress application
#

# installing PHP package on the server
package 'php' do
  action :install
end

# installling PHP-MYSQL package which is required to run MYSQL on the server
package 'php-mysql' do
  action :install
end

# restarting the httpd service after installing required PHP packges
service 'httpd' do
  action :restart
end
