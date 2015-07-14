require 'faker'
#
FactoryGirl.define do
  factory :ward do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "WARDID-#{n}" }
    ward_type 'StableWard' # default
  end
end
