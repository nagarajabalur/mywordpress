#add the dependency
require 'chefspec'
require 'chefspec/berkshelf'

#define the platform, and recipe which needs to be tested
describe 'mywordpress::apache' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7').converge(described_recipe) }

  #module checks whether httpd paackage is installed
  it 'installs a package with the default action' do
    expect(chef_run).to install_package('httpd')
  end

  #module checks whether httpd service is enabled or not
  it 'enables a service ' do
    expect(chef_run).to enable_service('httpd')
  end
end
