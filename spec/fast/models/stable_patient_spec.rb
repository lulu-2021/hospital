require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'ward_type_validatable'
require 'ward_type_validator'
#
require 'patient'
require 'stable_patient'
#
describe StablePatient do

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

  context 'testing the inheritance_column model type' do
    it 'should have an inheritance_column patient_type with the value of the model name' do
      expect(StablePatient.inheritance_column).to eq 'patient_type'

      test_patient = FactoryGirl.build(:stable_patient)
      expect(test_patient.patient_type).to eq 'StablePatient'
    end
  end

end
