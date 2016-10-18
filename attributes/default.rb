# attributes for Datadase name
default['mywordpress']['db']['name'] = 'wordpressdb'

# attributes for Datadase user name
default['mywordpress']['db']['user'] = 'wordpressuser'

# attributes for Datadase root password
default['mywordpress']['db']['root_password'] = 'password123'

# attributes for Datadase password
default['mywordpress']['db']['password'] = 'password123'

# attributes for WordPress version
default['mywordpress']['version'] = 'latest'

# attributes for WordPress tar download url link
default['mywordpress']['url'] = "https://wordpress.org/wordpress-#{node['mywordpress']['version']}.tar.gz"

# attribute for WordPress home directory
default['mywordpress']['wp_folder'] = '/var/www/html'

# attribute for WordPress database port
default['mywordpress']['db']['port'] = '3306'

# attribute for WordPress database version
default['mywordpress']['db']['version'] = '5.5'
