#download the latest wordpress tar file
remote_file '/tmp/latest.tar.gz' do
  source 'http://wordpress.org/latest.tar.gz'
  owner 'root'
  group 'root'
  mode '0755'
end

#create the folder structure for wordpress
directory '/var/www/wordpress' do
  action :create
  recursive true
  owner 'apache'
  group 'apache'
  mode  '0755'
end

#extract the downloaded tar file to /var/www/wordpress
bash 'extract_module' do
  cwd ::File.dirname('/tmp')
  code <<-EOH
    tar xzf '/tmp/latest.tar.gz' -C '/var/www/'
    EOH
end

#added the mysql db config's to  wp-config.php file
cookbook_file '/var/www/wordpress/wp-config.php' do
  source 'wp-config.php'
  owner 'apache'
  group 'apache'
  mode '0755'
end	