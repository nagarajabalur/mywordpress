# add the dependency
require 'chefspec'
require 'chefspec/berkshelf'

# define the platform for recipe which needs to be tested
describe 'mywordpress::app' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7').converge(described_recipe) }

  # check the downloaded wordpress tar file on the chef cache path
  it 'creates a remote_file with the default action' do
    expect(chef_run).to create_remote_file("#{Chef::Config['file_cache_path']}/latest.tar.gz")
  end

  # module to check template file wp-config.php which consist of wordpress db configs
  it 'creates a template_file with an explicit action' do
    expect(chef_run).to create_cookbook_file('/var/www/html/wp-config.php')
  end

  # module to check php-gd package installation
  it 'installs a package with the default action' do
    expect(chef_run).to install_package('php-gd')
  end

  # module to check httpd service restart action
  it 'restarts a service httpd ' do
    expect(chef_run).to restart_service('httpd')
  end
end
