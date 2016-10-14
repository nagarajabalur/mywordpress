#
# Cookbook Name:: mywordpress
# Recipe:: php
#
# author: Nagaraj Abalur
#
# This recipe will install php packages which is reqiured for wordpress application
# 

# install apache2 package
package 'httpd' do
  action :install
end

# enable httpd service and start
service 'httpd' do
  action [:enable, :start]
end
