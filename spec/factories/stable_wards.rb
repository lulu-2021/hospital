require 'faker'
#
FactoryGirl.define do
  factory :stable_ward do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "WARDID-#{n}" }

  end
end
