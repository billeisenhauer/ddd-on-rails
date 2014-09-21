module Model

  module Voyage

    class VoyageNumber

      def initialize(number)
        self.number = number
        freeze
      end

      attr_reader :number

      def ==(other)
        other.is_a?(VoyageNumber) && same_value_as?(other)
      end
      alias_method :eql?, :==

      private

        def number=(number)
          raise_null_arg_error unless number
          @number = number
        end

        def raise_null_arg_error
          raise ArgumentError.new('Voyage number may not be null')
        end

        def same_value_as?(other)
          other && number == other.number
        end

    end

  end

end