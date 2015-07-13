#
require 'rspec'
require 'rspec/core/rake_task'
#
namespace:tests do

  namespace :select do
    desc "Run fast specs..."
    RSpec::Core::RakeTask.new(:fast) do |t|
      t.pattern = FileList["spec/fast/**/*_spec.rb"]
    end
  end

  desc "Run all the Tests with FAST in the spec folder structure"
  task :run_tests => ["tests:select:fast"]
end
