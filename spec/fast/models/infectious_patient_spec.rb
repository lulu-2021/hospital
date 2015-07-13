require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'patient'
require 'infectious_patient'
#
describe EmergencyPatient do

  context 'testing the factory build' do
    it 'builds the infectious patient without failure' do
      expect(FactoryGirl.build(:infectious_patient)).to be_valid
    end
  end

  context 'testing the factory create' do
    it 'creates the infectious patient without failure' do
      expect(FactoryGirl.create(:infectious_patient)).to be_valid
    end
  end

end
