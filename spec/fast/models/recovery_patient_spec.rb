require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'patient'
require 'recovery_patient'
#
describe RecoveryPatient do

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

  context 'testing the inheritance_column model type' do
    it 'should have an inheritance_column patient_type with the value of the model name' do
      expect(RecoveryPatient.inheritance_column).to eq 'patient_type'

      test_patient = FactoryGirl.build(:recovery_patient)
      expect(test_patient.patient_type).to eq 'RecoveryPatient'
    end
  end
end
