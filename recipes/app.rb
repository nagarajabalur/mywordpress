#
# Cookbook Name:: mywordpress
# Recipe:: app
#
# author: Nagaraj Abalur
#
# This recipe will install wordpress application on the host
# 

sourceurl = node['wordpress']['url']

# download the latest wordpress tar file to chef cache

filepath = Chef::Config[:file_cache_path] + '/latest.tar.gz'

remote_file filepath do
  source sourceurl
  owner 'root'
  group 'root'
  mode '0755'
end

# extract the downloaded tar file
execute 'extract_some_tar' do
  command 'tar xzvf latest.tar.gz'
  cwd '/tmp/kitchen/cache'
  not_if { File.exists?("/tmp/kitchen/cache/wordpress/index.php") }
end

# copy the content of wordpress to /var/www/html
execute 'copy the wordpress content' do
  command 'cp -r /tmp/kitchen/cache/wordpress/* /var/www/html'
  not_if { File.exists?("/var/www/html/wordpress/index.php") }
end

# added the mysql db config's to  wp-config.php template
template '/var/www/html/wp-config.php' do
  source 'wp-config.php.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

# install php-gd package
package 'php-gd' do
  retries 3
  retry_delay 5
  action :install
end

# restart httpd service
service 'httpd' do
  action :restart
end