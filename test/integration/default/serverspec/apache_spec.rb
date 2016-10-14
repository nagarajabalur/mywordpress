require 'spec_helper'

describe package('httpd')
  it { should be_installed }
end

describe service('httpd')
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do  
  it { should be_listening }
end 

