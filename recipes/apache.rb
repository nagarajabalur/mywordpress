#
#Cookbook Name:: mywordpress
#Recipe:: php
#
#author: Nagaraj Abalur
#
#This recipe will install httpd packages which is reqiured for wordpress application
#

#installing the httpd yum package on the server
package 'httpd' do
  action :install
end

#enable the httpd service and then start hhtpd service
service 'httpd' do
  action [:enable, :start]
end
