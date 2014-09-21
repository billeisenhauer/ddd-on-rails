require 'spec_helper'

module Model

  module Location

    describe Location do

      describe "initialization" do

        it 'rejects nil UN/LOCODE with valid name' do
          expect {
            Location.new(nil, 'United States')
          }.to raise_error(ArgumentError, 'UN/Locode cannot be null')
        end

        it 'rejects nil name with valid UN/LOCODE' do
          expect {
            Location.new(UNLocode.new('USAA7'), nil)
          }.to raise_error(ArgumentError, 'Name cannot be null')
        end

        it 'creates a valid Location' do
          location = Location.new(UNLocode.new('USAA7'), 'United States')
          expect( location.un_locode ).to eql(UNLocode.new('USAA7'))
          expect( location.name ).to eql('United States')
        end

      end

      describe '#eql?' do

        let(:usaa7) { UNLocode.new("USAA7") }
        let(:united_states) { Location.new(usaa7, 'United States') }
        let(:nzab8) { UNLocode.new("NZAB8") }
        let(:new_zealand) { Location.new(nzab8, 'New Zealand') }

        it 'is unequal with other classes' do
          expect( united_states.eql?(Object.new) ).to be false
        end

        it 'is unequal with same class with different UN/Locode' do
          expect( united_states.eql?(new_zealand) ).to be false
        end

        it 'is equal with same class and same UN/Locode' do
          expect(
            united_states.eql?(Location.new(usaa7, 'United States'))
          ).to be true
        end

      end

    end

  end

end