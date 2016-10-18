#
#Cookbook Name:: mywordpress
#Recipe:: default
#
#author: Nagaraj Abalur
#
#This recipe will call the recipes to install apache, MYSQL, PHP and WordPress
#

#recipe to install apache
include_recipe 'mywordpress::apache'

#recipe to install MYSQL
include_recipe 'mywordpress::database'

#recipe to install PHP
include_recipe 'mywordpress::php'

#recipe to install WordPress app
include_recipe 'mywordpress::app'
