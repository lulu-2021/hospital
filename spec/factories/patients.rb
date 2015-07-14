require 'faker'
#
FactoryGirl.define do
  factory :patient do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "PATIENTID-#{n}" }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    patient_type 'StablePatient' # sensible default..

    ward
  end
end
