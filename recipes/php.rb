#
# Cookbook Name:: mywordpress
# Recipe:: php
#
# author: Nagaraj Abalur
#
# This recipe will install php packages which are required for wordpress application
# 

# install php package
package 'php' do
  retries 3
  retry_delay 5
  action :install
end

# install php-mysql package
yum_package 'php-mysql' do
  action :install
end

# restart apache
service 'httpd' do
  action :restart
end
