require 'active_record_spec_helper'
require 'spec_helper_fast'
#
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

end
