require 'faker'
#
FactoryGirl.define do
  factory :recovery_ward do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "RECOVERYWARDID-#{n}" }
    ward_type 'RecoveryWard'
  end
end
