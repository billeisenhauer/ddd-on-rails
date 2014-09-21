require 'rails_helper'

RSpec.describe LocationMapper do

  let(:data_austin) { FactoryGirl.build(:location) }
  let(:data_dallas) {
    FactoryGirl.build(:location, name: 'Dallas', un_locode: 'USDLX')
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

  describe "from data" do

    it 'converts instance to domain' do
      location = LocationMapper.from_data(data_austin)
      expect(location).to eq(domain_austin)
    end

    it 'converts enumerable to domain array' do
      expect(
        LocationMapper.from_data([data_austin, data_dallas])
      ).to eq([domain_austin, domain_dallas])
    end

  end

  describe "from domain" do

    it 'converts instance to data' do
      location = LocationMapper.from_domain(domain_austin)
      expect(location).to eq(data_austin)
    end

    it 'converts enumerable to data array' do
      expect(
        LocationMapper.from_domain([domain_austin, domain_dallas])
      ).to eq([data_austin, data_dallas])
    end

  end

end
