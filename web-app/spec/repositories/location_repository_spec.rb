require 'rails_helper'

RSpec.describe LocationRepository do

  let!(:data_austin) { FactoryGirl.create(:location) }
  let!(:data_dallas) {
    FactoryGirl.create(:location, name: 'Dallas', un_locode: 'USDLX')
  }

  let(:domain_austin) {
    Model::Location::Location.new(
      Model::Location::UNLocode.new(data_austin.un_locode),
      data_austin.name
    )
  }
  let(:domain_dallas) {
    Model::Location::Location.new(
      Model::Location::UNLocode.new(data_dallas.un_locode),
      data_dallas.name
    )
  }

  describe '#find' do

    it 'raises ItemNotFound exception if not found' do
      expect {
        LocationRepository.find("wont-be-found")
      }.to raise_error(ItemNotFound)
    end

    it 'returns domain instance when found' do
      expect(
        LocationRepository.find(data_austin.un_locode)
      ).to eq(domain_austin)
    end

  end

  describe '#find_all' do

    it 'returns domain array' do
      expect(
        LocationRepository.find_all
      ).to eq([domain_austin, domain_dallas])
    end

  end

end