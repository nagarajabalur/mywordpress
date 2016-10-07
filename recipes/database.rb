
mysql_client 'default' do
  action :create
end

mysql2_chef_gem 'default' do
  action :install
end

  mysql_service 'wordpressdb' do
    port '3306'
    version '5.5'
    initial_root_password 'password123'
    action [:create, :start]
  end

  socket = "/var/run/mysql-wordpressdb/mysqld.sock"

  mysql_connection_info = {
    :host     => 'localhost',
    :username => 'root',
    :socket   => socket,
    :password => 'password123'
  }

  mysql_database 'wordpressdb' do
    connection  mysql_connection_info
    action      :create
  end

  mysql_database_user 'wordpressuser' do
    connection    mysql_connection_info
    password      'password123'
    host          'localhost'
    database_name 'wordpressdb'
    action        :create
  end

  mysql_database_user 'wordpressuser' do
    connection    mysql_connection_info
    database_name 'wordpressdb'
    privileges    [:all]
    action        :grant
  end