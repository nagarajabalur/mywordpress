#add the dependency
require 'spec_helper'

# module which checks the installation of php package
describe package('php')
  it { should be_installed }
end
# module which checks the installation of php-mysql package
describe package('php-mysql')
  it { should be_installed }
end