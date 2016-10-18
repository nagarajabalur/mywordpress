# add the dependency
require 'chefspec'
require 'chefspec/berkshelf'

# define the platform for recipe which needs to be tested
describe 'mywordpress::php' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7').converge(described_recipe) }

  # module checks whether php paackage is installed or not
  it 'installs a package with the default action' do
    expect(chef_run).to install_package('php')
  end

  # module checks whether php-mysql paackage is installed or not
  it 'installs a package with the default action' do
    expect(chef_run).to install_package('php-mysql')
  end

  # module to check httpd service restart action
  it 'restarts a service httpd ' do
    expect(chef_run).to restart_service('httpd')
  end
end
