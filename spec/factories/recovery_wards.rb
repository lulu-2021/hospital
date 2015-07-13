require 'faker'
#
FactoryGirl.define do
  factory :recovery_ward do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "WARDID-#{n}" }

  end
end
