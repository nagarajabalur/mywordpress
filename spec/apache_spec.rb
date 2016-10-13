require 'chefspec'
require 'chefspec/berkshelf'

describe 'mywordpress::apache' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7').converge(described_recipe) }

  it 'installs a package with the default action' do
    expect(chef_run).to install_package('httpd')
  end

  it 'enables a service ' do
    expect(chef_run).to enable_service('httpd')
  end
end
