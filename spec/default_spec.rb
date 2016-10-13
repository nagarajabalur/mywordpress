require 'chefspec'
require 'chefspec/berkshelf'

describe 'mywordpress::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7').converge(described_recipe) }

  it 'includes the `other` recipe' do
    expect(chef_run).to include_recipe('mywordpress::apache')
  end

  it 'includes the `other` recipe' do
    expect(chef_run).to include_recipe('mywordpress::database')
  end

  it 'includes the `other` recipe' do
    expect(chef_run).to include_recipe('mywordpress::php')
  end

  it 'includes the `other` recipe' do
    expect(chef_run).to include_recipe('mywordpress::app')
  end
end
