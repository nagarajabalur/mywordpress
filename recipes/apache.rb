# install apache2 package
package 'httpd' do
  action :install
end

# enable httpd service and start
service 'httpd' do
  action [:enable, :start]
end
