#
require 'active_record'
require 'yaml'
#
# - we need to be able to parse ERB in the yaml file in some prod environments!
connection_info = YAML.load(ERB.new(File.read("config/database.yml")).result)["test"]

ActiveRecord::Base.establish_connection(connection_info)
#
RSpec.configure do |config|
  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end
end
