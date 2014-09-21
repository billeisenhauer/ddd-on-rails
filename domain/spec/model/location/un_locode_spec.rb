require 'spec_helper'

module Model

  module Location

    describe UNLocode do

      describe 'initialization' do

        it 'rejects nil UN/LOCODEs' do
          expect {
            UNLocode.new(nil)
          }.to raise_error(ArgumentError, 'Country and location may not be null')
        end

        it 'rejects non-matching UN/LOCODEs' do
          [
            "AAAA",
            "AAAAAA",
            "22AAA",
            "AA111"
          ].each do |unlocode|
            expect {
              UNLocode.new(unlocode)
            }.to raise_error(
              ArgumentError,
              "#{unlocode} is not a valid UN/LOCODE (does not match pattern)"
            )
          end
        end

        it 'returns uppercased UN/LOCODE from upper case code' do
          expect( UNLocode.new("USAA7").id_string ).to eql("USAA7")
        end

        it 'returns uppercased UN/LOCODE from mixed case code' do
          expect( UNLocode.new("USaa7").id_string ).to eql("USAA7")
        end

      end

      describe '#eql?' do

        let(:usaa7) { UNLocode.new("USAA7") }

        it 'is unequal with other classes' do
          expect( usaa7.eql?(Object.new) ).to be false
        end

        it 'is unequal with same class with different code' do
          expect( usaa7.eql?(UNLocode.new("USAA8")) ).to be false
        end

        it 'is equal with same class and same code' do
          expect( usaa7.eql?(UNLocode.new("USAA7")) ).to be true
        end

      end

    end

  end

end