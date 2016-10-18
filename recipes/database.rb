#
#Cookbook Name:: mywordpress
#Recipe:: database
#
#author: Nagaraj Abalur
#
#This recipe will install MYSQL  database and create the db user which is required for wordpress application
#

#defining the local varibale dbname and assign the value of attribute default['mywordpress']['db']['name']
dbname = node['mywordpress']['db']['name']

#defining the local varibale dbname and assign the value of attribute default['mywordpress']['db']['user']
dbusrname = node['mywordpress']['db']['user']

#defining the local varibale dbname and assign the value of attribute default['mywordpress']['db']['root_password']
db_initial_passwd = node['mywordpress']['db']['root_password']

#defining the local varibale dbname and assign the value of attribute default['mywordpress']['db']['password']
db_passwd = node['mywordpress']['db']['password']

#defining the local varibale dbname and assign the value of attribute default['mywordpress']['db']['port']
db_port = node['mywordpress']['db']['port']

#defining the local varibale dbname and assign the value of attribute default['mywordpress']['db']['version']
db_version = node['mywordpress']['db']['version']

#create Mysql client
mysql_client 'default' do
  action :create
end

#installing the dependency package mysql2_chef_gem which is required for MYSQL
mysql2_chef_gem 'default' do
  action :install
end

#Create a MYSQL database with the name as veriable dbname
#initial value will be set as variable value db_inital_passwd
mysql_service dbname do
  port db_port
  version db_version
  initial_root_password db_inital_passwd
  action [:create, :start]
end

#assigning the value for socket
socket = "/var/run/mysql-#{dbname}/mysqld.sock"

#create a symlink for/var/lib/mysql/mysql.sock from /var/run/mysql-#{dbname}/mysqld.sock
link '/var/lib/mysql/mysql.sock' do
  to socket
  not_if { File.exist?('/var/lib/mysql/mysql.sock') }
end

#set the M server details
mysql_connection_info = {
  host: 'localhost',
  username: 'root',
  socket: socket,
  password: db_initial_passwd
}

#create the database infomation
mysql_database dbname do
  connection  mysql_connection_info
  action      :create
end

#set the MYSQL db user details
mysql_database_user dbusrname do
  connection    mysql_connection_info
  password      db_passwd
  host          'localhost'
  database_name dbname
  action        :create
end

#set the MYSQL db user permissions
mysql_database_user 'wordpressuser' do
  connection    mysql_connection_info
  database_name dbname
  privileges    [:all]
  action        :grant
end
