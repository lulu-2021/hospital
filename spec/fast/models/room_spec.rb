require 'active_record_spec_helper'
require 'spec_helper_fast'
#
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

end
