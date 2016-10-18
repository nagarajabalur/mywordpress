# add the dependency
require 'spec_helper'

# module which checks the installation of php--gd package
describe package('php-gd') do
  it { should be_installed }
end
