remote_file '/tmp/latest.tar.gz' do
  source 'http://wordpress.org/latest.tar.gz'
  owner 'root'
  group 'root'
  mode '0755'
end

directory '/var/www/wordpress' do
  action :create
  recursive true
  owner 'apache'
  group 'apache'
  mode  '0755'
end

bash 'extract_module' do
  cwd ::File.dirname('/tmp')
  code <<-EOH
    tar xzf '/tmp/latest.tar.gz' -C '/var/www/'
    EOH
end

cookbook_file '/var/www/wordpress/wp-config.php' do
  source 'wp-config.php'
  owner 'apache'
  group 'apache'
  mode '0755'
end	