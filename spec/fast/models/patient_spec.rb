require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'bed_validatable'
require 'bed_validator'
require 'ward_type_validatable'
require 'ward_type_validator'
#
require 'bed'
require 'room'
require 'ward'
require 'recovery_ward'
require 'emergency_ward'
require 'stable_ward'
require 'patient'
#
describe Patient do

  context 'testing the factory build' do
    it 'builds the patient without failure' do
      expect(FactoryGirl.build(:patient)).to be_valid
    end
  end

  context 'testing the factory create' do
    it 'creates the patient without failure' do
      expect(FactoryGirl.create(:patient)).to be_valid
    end
  end

  context 'correctly allocating a patient to a bed' do
    it 'can only allocate a patient to a bed of the same patient/ward type' do
      stable_ward = FactoryGirl.create(:stable_ward)
      test_room = FactoryGirl.create(:room, ward_id: stable_ward.id)
      test_bed = FactoryGirl.create(:bed, room_id: test_room.id)
      stable_patient = FactoryGirl.build(:patient, patient_type: 'StablePatient')

      stable_patient.ward_id = stable_ward
      stable_patient.bed_id = test_bed

      expect(stable_patient).to be_valid
    end
  end

  context 'incorrectly allocating a patient to a bed' do
    it 'cannot allocate a patient to a bed if the wrong patient/ward type' do
      emergency_ward = FactoryGirl.create(:emergency_ward)
      test_room = FactoryGirl.create(:room, ward_id: emergency_ward.id)
      test_bed = FactoryGirl.create(:bed, room_id: test_room.id)
      stable_patient = FactoryGirl.build(:patient,
        patient_type: 'StablePatient',
        ward_id: emergency_ward.id,
        #ward_id: nil,
        bed_id: test_bed.id
      )

      expect(stable_patient).to_not be_valid
    end

    it 'cannot allocate a patient to a bed if the no ward is set' do
      recovery_ward = FactoryGirl.create(:recovery_ward)
      test_room = FactoryGirl.create(:room, ward_id: recovery_ward.id)
      test_bed = FactoryGirl.create(:bed, room_id: test_room.id)
      stable_patient = FactoryGirl.build(:patient,
        patient_type: 'StablePatient',
        ward_id: nil,
        bed_id: test_bed.id
        )

        expect(stable_patient).to_not be_valid
      end
  end

  context 'must have a patient_type set' do
    it 'must be one of the correct patient types' do
      stable_patient = FactoryGirl.build(:patient, patient_type: 'StablePatient')
      infectious_patient = FactoryGirl.build(:patient, patient_type: 'InfectiousPatient')
      emergency_patient = FactoryGirl.build(:patient, patient_type: 'EmergencyPatient')
      recovery_patient = FactoryGirl.build(:patient, patient_type: 'RecoveryPatient')

      patient_types = [:stable, :emergency, :infectious, :recovery]
      expect(patient_types).to include stable_patient.patient_type.underscore.split('_').first.to_sym
      expect(patient_types).to include emergency_patient.patient_type.underscore.split('_').first.to_sym
      expect(patient_types).to include infectious_patient.patient_type.underscore.split('_').first.to_sym
      expect(patient_types).to include recovery_patient.patient_type.underscore.split('_').first.to_sym
    end
  end

end
