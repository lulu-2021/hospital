require 'faker'
#
FactoryGirl.define do
  factory :bed do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "BEDID-#{n}" }

    room
    patient
    
  end
end
