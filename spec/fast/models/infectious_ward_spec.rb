require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'ward'
require 'Infectious_ward'
#
describe InfectiousWard do

  context 'testing the factory build' do
    it 'builds the ward without failure' do
      expect(FactoryGirl.build(:infectious_ward)).to be_valid
    end
  end

  context 'testing the factory create' do
    it 'creates the ward without failure' do
      expect(FactoryGirl.create(:infectious_ward)).to be_valid
    end
  end

  context 'testing the inheritance_column model type' do
    it 'should have an inheritance_column patient_type with the value of the model name' do
      expect(InfectiousWard.inheritance_column).to eq 'ward_type'

      test_ward = FactoryGirl.build(:infectious_ward)
      expect(test_ward.ward_type).to eq 'InfectiousWard'
    end
  end

end
