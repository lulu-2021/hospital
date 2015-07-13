require 'active_record_spec_helper'
require 'spec_helper_fast'
#
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

end
