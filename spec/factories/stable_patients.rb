require 'faker'
#
FactoryGirl.define do
  factory :stable_patient do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "PATIENTID-#{n}" }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
