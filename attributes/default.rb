#attributes for Data dase name
default['mywordpress']['db']['name'] = "wordpressdb"

#attributes for Data dase user name
default['mywordpress']['db']['user'] = "wordpressuser"

#attributes for Data dase root password
default['mywordpress']['db']['root_password'] = "password123"

#attributes for Data dase password
default['mywordpress']['db']['password'] = "password123"

#attributes for wordpress version
default['wordpress']['version'] = 'latest'

#attributes for wordpress tar download url link
default['wordpress']['url'] = "https://wordpress.org/wordpress-#{node['wordpress']['version']}.tar.gz"
