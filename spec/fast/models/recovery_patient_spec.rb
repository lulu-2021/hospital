require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'patient'
require 'recovery_patient'
#
describe EmergencyPatient do

  context 'testing the factory build' do
    it 'builds the recovery patient without failure' do
      expect(FactoryGirl.build(:recovery_patient)).to be_valid
    end
  end

  context 'testing the factory create' do
    it 'creates the recovery patient without failure' do
      expect(FactoryGirl.create(:recovery_patient)).to be_valid
    end
  end

end
