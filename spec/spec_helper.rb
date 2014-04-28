$:.push File.expand_path( '..', __FILE__ )

require 'rspec'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.before { puts 'db setup or something' }
end
