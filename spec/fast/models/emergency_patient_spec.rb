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

  context 'testing the inheritance_column model type' do
    it 'should have an inheritance_column patient_type with the value of the model name' do
      expect(EmergencyPatient.inheritance_column).to eq 'patient_type'

      test_patient = FactoryGirl.build(:emergency_patient)
      expect(test_patient.patient_type).to eq 'EmergencyPatient'
    end
  end
end
