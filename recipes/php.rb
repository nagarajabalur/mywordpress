#
# Cookbook Name:: mywordpress
# Recipe:: php
#
# author: Nagaraj Abalur
#
# This recipe will install php packages which are required for wordpress application
# 

# installing php package on the server
package 'php' do
  retries 3
  retry_delay 5
  action :install
end

# installling php-mysql package which is required to run mysql on the server
package 'php-mysql' do
  action :install
end

# restarting the httpd service after installing required php packges
service 'httpd' do
  action :restart
end
