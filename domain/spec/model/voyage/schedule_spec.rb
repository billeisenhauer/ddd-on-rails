require 'spec_helper'

module Model

  module Voyage

    describe Schedule do

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

      let(:other_cm) {
        CarrierMovement.new(
          new_zealand,
          united_states,
          jan_1_2014,
          may_1_2014
        )
      }

      describe 'initialization' do

        it 'rejects nil carrier movement list' do
          expect {
            Schedule.new(nil)
          }.to raise_error(ArgumentError, 'Carrier movements list may not be null')
        end

        it 'rejects empty carrier movement list' do
          expect {
            Schedule.new(CarrierMovementList::EMPTY_LIST)
          }.to raise_error(ArgumentError, 'Carrier movements list may not be empty')
        end

      end

      describe '#carrier_movement_list' do

        before(:each) do
          @list = CarrierMovementList.new
          @list.add(cm)
          @schedule = Schedule.new(@list)
        end

        it 'returns its list' do
          expect( @schedule.carrier_movement_list.map.to_a ).to eq @list.map.to_a
        end

      end

      describe 'equality' do

        before(:each) do
          @list = CarrierMovementList.new
          @list.add(cm)
          @schedule = Schedule.new(@list)
        end

        it 'is unequal with other classes' do
          expect( @schedule.eql?(Object.new) ).to be false
        end

        it 'is unequal with same class with different list' do
          list = CarrierMovementList.new
          list.add(other_cm)
          expect(
            @schedule.eql?(Schedule.new(list))
          ).to be false
        end

        it 'is equal with same class and same list' do
          expect( @schedule ).to eq Schedule.new(@list)
        end

      end

    end

  end

end