require 'faker'
#
FactoryGirl.define do
  factory :infectious_ward do
    sequence(:id) { |n| SecureRandom.uuid }
    sequence(:identifier) {|n| "INFECTIOUSWARDID-#{n}" }
    ward_type 'InfectiousWard'
  end
end
