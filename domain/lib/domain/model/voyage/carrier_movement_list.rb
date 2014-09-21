module Model

  module Voyage

    class CarrierMovementList
      include Enumerable

      def initialize
        @carrier_movements = []
      end

      def add(carrier_movement)
        raise_null_arg_error unless carrier_movement
        raise_class_arg_error unless carrier_movement.is_a?(CarrierMovement)
        carrier_movements << carrier_movement
      end

      def each
        carrier_movements.each do |carrier_movement|
          yield(carrier_movement)
        end
      end

      def ==(other)
        other.is_a?(CarrierMovementList) && same_value_as?(other)
      end
      alias_method :eql?, :==

      protected

        attr_reader :carrier_movements

      private

        def raise_null_arg_error
          raise ArgumentError.new('Carrier movement may not be null')
        end

        def raise_class_arg_error
          raise ArgumentError.new('Carrier movement instances only')
        end

        def same_value_as?(other)
          other && carrier_movements == other.carrier_movements
        end

    end

    class CarrierMovementList

      EMPTY_LIST = new.freeze

    end


  end

end