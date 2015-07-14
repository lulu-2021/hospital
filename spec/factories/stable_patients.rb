require 'faker'
#
FactoryGirl.define do
  factory :stable_patient do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "STABLEPATIENTID-#{n}" }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    patient_type 'StablePatient'
  end
end
