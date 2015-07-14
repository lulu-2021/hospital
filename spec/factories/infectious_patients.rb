require 'faker'
#
FactoryGirl.define do
  factory :infectious_patient do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "INFECTIOUSPATIENTID-#{n}" }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    patient_type 'InfectiousPatient'
  end
end
