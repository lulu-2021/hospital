require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'bed'
require 'room'
require 'bed_validatable'
require 'bed_validator'
require 'ward_type_validatable'
require 'ward_type_validator'
require 'ward'
#
require 'stable_ward'
require 'patient'
require 'stable_patient'
require 'room_service'
#
describe RoomService do

  context 'testing the moving of a patient to a new room' do
    it 'should successfully move a patient to a new room and allocate a new bed' do
      stable_ward = FactoryGirl.create(:stable_ward)
      room1 = FactoryGirl.create(:room, ward_id: stable_ward.id)
      room2 = FactoryGirl.create(:room, ward_id: stable_ward.id)
      bed1 = FactoryGirl.create(:bed, room_id: room1.id)
      bed2 = FactoryGirl.create(:bed, room_id: room2.id)
      test_patient = FactoryGirl.create(:stable_patient, ward_id: stable_ward.id, bed_id: bed1.id)
      room_service = RoomService.new
      room_service.move_patient_keep_bed(test_patient.id, room2.id)
      patient = Patient.find(test_patient.id)
      room = Room.find(room2.id)

      expect(test_patient.ward_id).to eq room2.ward_id
      expect(patient.bed.room_id).to eq room.id
    end

    it 'should successfully move a patient to a new room and move the bed' do
      stable_ward = FactoryGirl.create(:stable_ward)
      room1 = FactoryGirl.create(:room, ward_id: stable_ward.id)
      room2 = FactoryGirl.create(:room, ward_id: stable_ward.id)
      bed1 = FactoryGirl.create(:bed, room_id: room1.id)
      free_bed = FactoryGirl.create(:bed, room_id: room2.id)
      test_patient = FactoryGirl.create(:stable_patient, ward_id: stable_ward.id, bed_id: bed1.id)
      room_service = RoomService.new
      room_service.move_patient_allocate_new_bed(test_patient.id, room2.id, free_bed.id)

      patient = Patient.find(test_patient.id)
      room = Room.find(room2.id)
      bed = Bed.find(free_bed.id)

      expect(patient.ward_id).to eq room.ward_id
      expect(patient.bed_id).to eq bed.id
    end
  end
end
