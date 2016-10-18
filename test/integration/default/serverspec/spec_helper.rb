#define serverspec default settings
require 'highline/import'

if ENV['ASK_LOGIN_PASSWORD']
  options[:password] = ask("\nEnter login password: ") { |q| q.echo = false }
else
  options[:password] = ENV['LOGIN_PASSWORD']
end

set :ssh_options, options
