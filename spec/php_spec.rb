require 'chefspec'
require 'chefspec/berkshelf'

describe 'mywordpress::php' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7').converge(described_recipe) }

  it 'installs a package with the default action' do
    expect(chef_run).to install_package('php')
  end

  it 'installs a package with the default action' do
    expect(chef_run).to install_package('php-mysql')
  end

  it 'restarts a service httpd ' do
    expect(chef_run).to restart_service('httpd')
  end
end
