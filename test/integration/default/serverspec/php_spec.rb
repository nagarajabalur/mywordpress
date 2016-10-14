require 'spec_helper'

describe package('php')
  it { should be_installed }
end

describe package('php-mysql')
  it { should be_installed }
end