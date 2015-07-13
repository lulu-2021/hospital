require 'rspec'
require 'rspec/core/rake_task'

namespace:tests do

  namespace :select do
    desc "Run controller specs..."
    RSpec::Core::RakeTask.new(:controllers) do |t|
      t.pattern = FileList["spec/controllers/**/*_spec.rb"]
    end
  end

  desc "Run all the Tests with CONTROLLERS in the spec folder structure"
  task :run_tests => ["tests:select:controllers"]
end
