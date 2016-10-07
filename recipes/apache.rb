# install apache2 package
package 'httpd' do
  retries 3
  retry_delay 5
  action :install
end

# enable httpd service and start
service 'httpd' do
  action [:enable, :start]
end
