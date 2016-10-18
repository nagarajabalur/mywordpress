#
# Cookbook Name:: mywordpress
# Recipe:: default
#
# author: Nagaraj Abalur
#
# This recipe will call the recipes to install apache, mysql, php and wordpress
#

# recipe to install apache
include_recipe 'mywordpress::apache'

# recipe to install mysql
include_recipe 'mywordpress::database'

# recipe to install php
include_recipe 'mywordpress::php'

# recipe to install wordpress app
include_recipe 'mywordpress::app'
