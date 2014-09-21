require 'spec_helper'

module Model

  module Voyage

    describe CarrierMovement do

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

      describe 'initialization' do

        it 'knows its attributes after initialized' do
          cm = CarrierMovement.new(
            united_states,
            new_zealand,
            jan_1_2014,
            may_1_2014
          )
          expect( cm.departure_location ).to eql(united_states)
          expect( cm.arrival_location ).to eql(new_zealand)
          expect( cm.departure_time ).to eql(jan_1_2014)
          expect( cm.arrival_time ).to eql(may_1_2014)
        end

        it 'rejects nil destination location' do
          expect {
            CarrierMovement.new(
              nil,
              new_zealand,
              jan_1_2014,
              may_1_2014
            )
          }.to raise_error(ArgumentError, 'Departure location may not be null')
        end

        it 'rejects nil arrival location' do
          expect {
            CarrierMovement.new(
              united_states,
              nil,
              jan_1_2014,
              may_1_2014
            )
          }.to raise_error(ArgumentError, 'Arrival location may not be null')
        end

        it 'rejects nil destination time' do
          expect {
            CarrierMovement.new(
              united_states,
              new_zealand,
              nil,
              may_1_2014
            )
          }.to raise_error(ArgumentError, 'Departure time may not be null')
        end

        it 'rejects nil arrival time' do
          expect {
            CarrierMovement.new(
              united_states,
              new_zealand,
              jan_1_2014,
              nil
            )
          }.to raise_error(ArgumentError, 'Arrival time may not be null')
        end

      end

      describe '#eql?' do

        let(:cm) {
          CarrierMovement.new(
            united_states,
            new_zealand,
            jan_1_2014,
            may_1_2014
          )
        }
        let(:cm) {
          CarrierMovement.new(
            united_states,
            new_zealand,
            jan_1_2014,
            may_1_2014
          )
        }

        it 'is unequal with other classes' do
          expect( cm.eql?(Object.new) ).to be false
        end

        it 'is unequal with same class with different values' do
          expect( cm.eql?(
            CarrierMovement.new(
              new_zealand,
              united_states,
              jan_1_2014,
              may_1_2014
            )
          )).to be false
        end

        it 'is equal with same class and same values' do
          expect( cm.eql?(
            CarrierMovement.new(
              united_states,
              new_zealand,
              jan_1_2014,
              may_1_2014
            )
          )).to be true
        end

      end

    end

  end

end