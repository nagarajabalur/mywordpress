# add the dependency
require 'spec_helper'

# module which checks whether httpd paackage is installed
describe package('httpd') do
  it { should be_installed }
end

# module which checks whether httpd service is enabled and started
describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

# module which checks whether port 80 is listening or not
describe port(80) do
  it { should be_listening }
end
