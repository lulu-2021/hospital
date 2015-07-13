require 'faker'
#
FactoryGirl.define do
  factory :room do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "ROOMID-#{n}" }

    ward

  end
end
