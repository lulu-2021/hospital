require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'patient'
require 'emergency_patient'
#
describe EmergencyPatient do

  context 'testing the factory build' do
    it 'builds the emergency patient without failure' do
      expect(FactoryGirl.build(:emergency_patient)).to be_valid
    end
  end

  context 'testing the factory create' do
    it 'creates the emergency patient without failure' do
      expect(FactoryGirl.create(:emergency_patient)).to be_valid
    end
  end
end
