require 'spec_helper'

module Model

  module Voyage

    describe VoyageNumber do

      describe 'initialization' do

        it 'rejects nil number' do
          expect {
            VoyageNumber.new(nil)
          }.to raise_error(ArgumentError, 'Voyage number may not be null')
        end

        it 'returns number after initialized' do
          expect( VoyageNumber.new("12345").number ).to eql("12345")
        end

      end

      describe '#eql?' do

        let(:vn_1) { VoyageNumber.new("12345") }

        it 'is unequal with other classes' do
          expect( vn_1.eql?(Object.new) ).to be false
        end

        it 'is unequal with same class with different number' do
          expect( vn_1.eql?(VoyageNumber.new('54321')) ).to be false
        end

        it 'is equal with same class and same number' do
          expect( vn_1.eql?(VoyageNumber.new('12345')) ).to be true
        end

      end

    end

  end

end