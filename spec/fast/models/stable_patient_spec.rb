require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'patient'
require 'stable_patient'
#
describe EmergencyPatient do

  context 'testing the factory build' do
    it 'builds the stable patient without failure' do
      expect(FactoryGirl.build(:stable_patient)).to be_valid
    end
  end

  context 'testing the factory create' do
    it 'creates the stable patient without failure' do
      expect(FactoryGirl.create(:stable_patient)).to be_valid
    end
  end

end
