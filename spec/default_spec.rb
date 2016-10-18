#add the dependency
require 'chefspec'
require 'chefspec/berkshelf'

#define the platform for recipe which needs to be tested
describe 'mywordpress::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7').converge(described_recipe) }

  #module to check whether apache recipe is included or not
  it 'includes the apache recipe' do
    expect(chef_run).to include_recipe('mywordpress::apache')
  end

  #module to check whether database recipe is included or not
  it 'includes the database recipe' do
    expect(chef_run).to include_recipe('mywordpress::database')
  end

  #module to check whether php recipe is included or not
  it 'includes the php recipe' do
    expect(chef_run).to include_recipe('mywordpress::php')
  end

  #module to check whether app recipe is included or not
  it 'includes the  app recipe' do
    expect(chef_run).to include_recipe('mywordpress::app')
  end
end
