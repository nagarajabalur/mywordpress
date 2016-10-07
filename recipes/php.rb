#install php package
package 'php' do
  retries 3
  retry_delay 5
  action :install
end

#restart apache
service 'httpd' do
  action  :restart
end