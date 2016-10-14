#attributes for DB
default['mywordpress']['db']['name'] = "wordpressdb"
default['mywordpress']['db']['user'] = "wordpressuser"
default['mywordpress']['db']['root_password'] = "password123"
default['mywordpress']['db']['password'] = "password123"

#attributes for wordpress 
default['wordpress']['version'] = 'latest'
default['wordpress']['url'] = "https://wordpress.org/wordpress-#{node['wordpress']['version']}.tar.gz"
