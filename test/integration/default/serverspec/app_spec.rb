require 'spec_helper'


describe package('php-gd')
  it { should be_installed }
end