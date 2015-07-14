require 'faker'
#
FactoryGirl.define do
  factory :stable_ward do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "STABLEWARDID-#{n}" }
    ward_type 'StableWard'
  end
end
