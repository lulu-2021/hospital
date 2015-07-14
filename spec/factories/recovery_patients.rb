require 'faker'
#
FactoryGirl.define do
  factory :recovery_patient do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "RECOVERYPATIENTID-#{n}" }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    patient_type 'RecoveryPatient'
  end
end
