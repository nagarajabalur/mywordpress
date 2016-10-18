#
# Cookbook Name:: mywordpress
# Recipe:: app
#
# author: Nagaraj Abalur
#
# This recipe will install wordpress application on the host
#

# download the latest WordPress tar from the WordPress official site
# place the downloaded file in chef cache

sourceurl = node['mywordpress']['url']
filepath = Chef::Config[:file_cache_path] + '/latest.tar.gz'
wp_folder = node['mywordpress']['wp_folder']

remote_file filepath do
  source sourceurl
  owner 'apache'
  group 'apache'
  mode '0755'
end

# extract the downloaded WordPress tar file to same to same location
# so extracted content will be in Chef::Config[:file_cache_path]/wordpress/* path
execute 'extract_WordPress_tar' do
  command 'tar xzvf latest.tar.gz'
  cwd Chef::Config[:file_cache_path]
  not_if { File.exist?("#{Chef::Config['file_cache_path']}/wordpress/index.php") }
end

# making sure var/www/html location is exist
directory wp_folder do
  owner 'apache'
  group 'apache'
  mode '0755'
  recursive true
end

# copy the content from chef cache path to var/www/html location
execute 'copy the WordPress content' do
  command "cp -r #{Chef::Config['file_cache_path']}/wordpress/* #{wp_folder}"
  not_if { File.exist?("#{wp_folder}/wordpress/index.php") }
end

# added the mysql db config's to  wp-config.php template
template "#{wp_folder}/wp-config.php" do
  source 'wp-config.php.erb'
  owner 'apache'
  group 'apache'
  mode '0644'
end

# installing php-gd package to make WordPress to work
package 'php-gd' do
  retries 3
  retry_delay 5
  action :install
end

# after all config and package installation restart the httpd service
service 'httpd' do
  action :restart
end
