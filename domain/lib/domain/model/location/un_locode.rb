module Model

  module Location

    class UNLocode

      def initialize(country_and_location)
        self.un_locode = country_and_location
        freeze
      end

      attr_reader :un_locode

      def id_string
        un_locode
      end

      alias_method :to_s, :id_string

      def same_value_as?(other)
        other && un_locode == other.un_locode
      end

      def ==(other)
        other.is_a?(UNLocode) && same_value_as?(other)
      end
      alias_method :eql?, :==

      private

        PATTERN = /^[a-zA-Z]{2}[a-zA-Z2-9]{3}$/
        private_constant :PATTERN

        def un_locode=(un_locode)
          raise_null_arg_error unless un_locode
          raise_pattern_mismatch_arg_error(un_locode) unless un_locode =~ PATTERN
          @un_locode = un_locode.upcase
        end

        def raise_null_arg_error
          raise ArgumentError.new('Country and location may not be null')
        end

        def raise_pattern_mismatch_arg_error(un_locode)
          msg = "#{un_locode} is not a valid UN/LOCODE (does not match pattern)"
          raise ArgumentError.new(msg)
        end

    end

  end

end