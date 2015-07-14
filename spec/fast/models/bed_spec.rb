require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'bed_validatable'
require 'bed_validator'
require 'ward_type_validatable'
require 'ward_type_validator'
#
require 'patient'
require 'ward'
require 'room'
require 'bed'
#
describe Bed do

  context 'testing the factory build' do
    it 'builds the bed without failure' do
      expect(FactoryGirl.build(:bed)).to be_valid
    end
  end

  context 'testing the factory create' do
    it 'creates the bed without failure' do
      expect(FactoryGirl.create(:bed)).to be_valid
    end
  end

  context 'a bed can only have one patient' do
    it 'the bed is valid with an associated patient' do
      test_patient = FactoryGirl.create(:stable_patient)
      test_bed = FactoryGirl.build(:bed, patient_id: test_patient.id)
      expect(test_bed).to be_valid
    end

    it 'the bed is valid without an associated patient' do
      test_bed = FactoryGirl.build(:bed, patient_id: nil)
      expect(test_bed).to be_valid
    end
  end
end
