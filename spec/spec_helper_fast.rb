#
# Fast tests spec helper - avoiding the load of the Rails Framework
#
require 'rspec'
require 'rspec/collection_matchers'
require 'factory_girl'
#
RSpec.configure do |config|
  config.order = 'random'
  config.include FactoryGirl::Syntax::Methods
end
# - This enables us to search automatically in app/models
$:.unshift File.expand_path '../../app/models', __FILE__
#
# this requires all the FactoryGirl factories
Dir.glob(File.expand_path 'spec/factories/*.rb').each { |f| require f }
