#
# Cookbook Name:: mywordpress
# Recipe:: database
#
# author: Nagaraj Abalur
#
# This recipe will install mysql  database and create the db user which is required for wordpress application
# 

dbname = node['mywordpress']['db']['name'] 
dbusrname = node['mywordpress']['db']['user']
db_inital_passwd = node['mywordpress']['db']['root_password'] 
db_passwd = node['mywordpress']['db']['password'] 

mysql_client 'default' do
  action :create
end

mysql2_chef_gem 'default' do
  action :install
end

# create mysql Database
mysql_service dbname do
  port '3306'
  version '5.5'
  initial_root_password db_inital_passwd
  action [:create, :start]
end

socket = "/var/run/mysql-#{dbname}/mysqld.sock"

# create a symlink for mysql.sock
link '/var/lib/mysql/mysql.sock' do
  to socket
  not_if 'test -f /var/lib/mysql/mysql.sock'
end

# mysql details
mysql_connection_info = {
  host: 'localhost',
  username: 'root',
  socket: socket,
  password: db_inital_passwd
}

mysql_database dbname do
  connection  mysql_connection_info
  action      :create
end
# mysql db user details
mysql_database_user dbusrname do
  connection    mysql_connection_info
  password      db_passwd
  host          'localhost'
  database_name  dbname
  action        :create
end

# mysql db user permissions
mysql_database_user 'wordpressuser' do
  connection    mysql_connection_info
  database_name dbname
  privileges    [:all]
  action        :grant
end