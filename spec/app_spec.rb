require 'chefspec'
require 'chefspec/berkshelf'

describe 'mywordpress::app' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7').converge(described_recipe) }

  it 'creates a remote_file with the default action' do
    expect(chef_run).to create_remote_file('/etc/latest.tar.gz')
  end

  it 'creates a cookbook_file with an explicit action' do
    expect(chef_run).to create_cookbook_file('/var/www/html/wp-config.php')
  end

  it 'installs a package with the default action' do
    expect(chef_run).to install_package('php-gd')
  end

  it 'restarts a service httpd ' do
    expect(chef_run).to restart_service('httpd')
  end
end
