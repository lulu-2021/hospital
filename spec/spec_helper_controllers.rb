# - Runs the standard Railsie Spec Helper
require 'spec_helper'
#
require 'spec_helper_constants'
#
require 'rspec/given'
require 'factory_girl'
#
# this requires all the FactoryGirl factories
Dir.glob(File.expand_path 'spec/factories/*.rb').each { |f| require f }
#
