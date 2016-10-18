#attributes for Datadase name
default['mywordpress']['db']['name'] = 'wordpressdb'

#attributes for Datadase user name
default['mywordpress']['db']['user'] = 'wordpressuser'

#attributes for Datadase root password
default['mywordpress']['db']['root_password'] = 'password123'

#attributes for Datadase password
default['mywordpress']['db']['password'] = 'password123'

#attributes for wordpress version
default['mywordpress']['version'] = 'latest'

#attributes for wordpress tar download url link
default['mywordpress']['url'] = "https://wordpress.org/wordpress-#{node['mywordpress']['version']}.tar.gz"

#attribute for wordpress home directory
default['mywordpress']['wp_folder'] = '/var/www/html'
