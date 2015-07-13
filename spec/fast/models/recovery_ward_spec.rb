require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'ward'
require 'Recovery_ward'
#
describe RecoveryWard do

  context 'testing the factory build' do
    it 'builds the ward without failure' do
      expect(FactoryGirl.build(:recovery_ward)).to be_valid
    end
  end

  context 'testing the factory create' do
    it 'creates the ward without failure' do
      expect(FactoryGirl.create(:recovery_ward)).to be_valid
    end
  end

  context 'testing the inheritance_column model type' do
    it 'should have an inheritance_column patient_type with the value of the model name' do
      expect(RecoveryWard.inheritance_column).to eq 'ward_type'

      test_ward = FactoryGirl.build(:recovery_ward)
      expect(test_ward.ward_type).to eq 'RecoveryWard'
    end
  end

end
