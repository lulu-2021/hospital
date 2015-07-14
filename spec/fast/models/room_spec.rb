require 'active_record_spec_helper'
require 'spec_helper_fast'
#
require 'patient'
require 'bed'
require 'ward'
require 'room'
#
describe Room do

  context 'testing the factory build' do
    it 'builds the room without failure' do
      expect(FactoryGirl.build(:room)).to be_valid
    end
  end

  context 'testing the factory create' do
    it 'creates the room without failure' do
      expect(FactoryGirl.create(:room)).to be_valid
    end
  end

  context 'a room can have a maximum of 4 beds' do

    it 'can have four beds' do
      test_room = FactoryGirl.create(:room)
      test_bed1 = FactoryGirl.create(:bed, room_id: test_room.id)
      test_bed2 = FactoryGirl.create(:bed, room_id: test_room.id)
      test_bed3 = FactoryGirl.create(:bed, room_id: test_room.id)
      test_bed4 = FactoryGirl.create(:bed, room_id: test_room.id)

      expect(test_room).to be_valid
    end

    it 'cannot have more than four beds' do
      test_room = FactoryGirl.create(:room)

      test_bed1 = FactoryGirl.create(:bed, room_id: test_room.id)
      test_bed2 = FactoryGirl.create(:bed, room_id: test_room.id)
      test_bed3 = FactoryGirl.create(:bed, room_id: test_room.id)
      test_bed4 = FactoryGirl.create(:bed, room_id: test_room.id)

      # - expect the creation of the bed that maxes out the room bed_count to raise an AR error!
      expect{FactoryGirl.create(:bed, room_id: test_room.id)}.to raise_exception ActiveRecord::RecordInvalid
    end
  end
end
