require 'faker'
#
FactoryGirl.define do
  factory :emergency_ward do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "EMERGENCYWARDID-#{n}" }
    ward_type 'EmergencyWard'
  end
end
