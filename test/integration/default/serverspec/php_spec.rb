#add the dependency
require 'spec_helper'

#module which checks the installation of php package
describe package('php') do
  it { should be_installed }
end
#module which checks the installation of php-mysql package
describe package('php-mysql') do
  it { should be_installed }
end
