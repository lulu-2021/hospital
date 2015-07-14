require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'bed_validatable'
require 'bed_validator'
require 'ward_type_validatable'
require 'ward_type_validator'
require 'ward'
#
describe Ward do

  context 'testing the factory build' do
    it 'builds the ward without failure' do
      expect(FactoryGirl.build(:ward)).to be_valid
    end
  end

  context 'testing the factory create' do
    it 'creates the ward without failure' do
      expect(FactoryGirl.create(:ward)).to be_valid
    end
  end

  context 'must have a ward_type set' do
    it 'must be one of the correct ward types' do
      stable_ward = FactoryGirl.build(:ward, ward_type: 'StableWard')
      infectious_ward = FactoryGirl.build(:ward, ward_type: 'InfectiousWard')
      emergency_ward = FactoryGirl.build(:ward, ward_type: 'EmergencyWard')
      recovery_ward = FactoryGirl.build(:ward, ward_type: 'RecoveryWard')

      ward_names = [:stable, :emergency, :infectious, :recovery]
      expect(ward_names).to include stable_ward.ward_type.underscore.split('_').first.to_sym
      expect(ward_names).to include emergency_ward.ward_type.underscore.split('_').first.to_sym
      expect(ward_names).to include infectious_ward.ward_type.underscore.split('_').first.to_sym
      expect(ward_names).to include recovery_ward.ward_type.underscore.split('_').first.to_sym
    end
  end
end
