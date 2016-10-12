#download the latest wordpress tar file
remote_file '/tmp/latest.tar.gz' do
  source 'http://wordpress.org/latest.tar.gz'
  owner 'root'
  group 'root'
  mode '0755'
end

#extract the downloaded tar file to /var/www/wordpress

execute 'extract_some_tar' do
  command 'tar xzvf latest.tar.gz'
  cwd '/tmp'
  only_if { File.exists?("/tmp/latest.tar.gz") }
end


execute 'copy the wordpress content' do
  command 'cp -r /tmp/wordpress/* /var/www/html'
end

#added the mysql db config's to  wp-config.php file
cookbook_file '/var/www/html/wp-config.php' do
  source 'wp-config.php'
  owner 'root'
  group 'root'
  mode '0644'
end	

package 'php-gd' do
  retries 3
  retry_delay 5
  action :install
end

service 'httpd' do
  action  :restart
end