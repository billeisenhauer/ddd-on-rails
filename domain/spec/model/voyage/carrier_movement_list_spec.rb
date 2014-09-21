require 'spec_helper'

module Model

  module Voyage

    describe CarrierMovementList do

      let(:united_states) {
        Model::Location::Location.new(
          Model::Location::UNLocode.new("USAA7"),
          'United States'
        )
      }
      let(:new_zealand) {
        Model::Location::Location.new(
          Model::Location::UNLocode.new("NZAB8"),
          'New Zealand'
        )
      }
      let(:jan_1_2014) { DateTime.httpdate('Wed, 01 Jan 2014 08:00:00 GMT') }
      let(:may_1_2014) { DateTime.httpdate('Thu, 01 May 2014 17:00:00 GMT') }

      let(:cm) {
        CarrierMovement.new(
          united_states,
          new_zealand,
          jan_1_2014,
          may_1_2014
        )
      }

      before(:each) do
        @list = CarrierMovementList.new
      end

      describe "#add" do

        it 'restricts to CarrierMovement elements; disallowing null' do
          expect {
            @list.add(nil)
          }.to raise_error(ArgumentError, 'Carrier movement may not be null')
        end

        it 'restricts to CarrierMovement elements' do
          expect {
            @list.add(Object.new)
          }.to raise_error(ArgumentError, 'Carrier movement instances only')
        end

        it 'adds a CarrierMovement to the list' do
          expect {
            @list.add(cm)
          }.to change(@list, :count).by(1)
        end

      end

      describe "#each" do

        before(:each) do
          @list.add(cm)
        end

        it 'iterates over carrier movements' do
          expect( @list.map.to_a ).to eq [cm]
        end

      end

    end

  end

end
