require 'faker'
#
FactoryGirl.define do
  factory :emergency_patient do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "EMERGENCYPATIENTID-#{n}" }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    patient_type 'EmergencyPatient'
  end
end
