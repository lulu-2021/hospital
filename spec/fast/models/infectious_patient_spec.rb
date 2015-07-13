require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'patient'
require 'infectious_patient'
#
describe InfectiousPatient do

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

  context 'testing the inheritance_column model type' do
    it 'should have an inheritance_column patient_type with the value of the model name' do
      expect(InfectiousPatient.inheritance_column).to eq 'patient_type'

      test_patient = FactoryGirl.build(:infectious_patient)
      expect(test_patient.patient_type).to eq 'InfectiousPatient'
    end
  end

end
