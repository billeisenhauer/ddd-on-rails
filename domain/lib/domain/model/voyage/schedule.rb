module Model

  module Voyage

    class Schedule

      def initialize(carrier_movement_list)
        self.carrier_movement_list = carrier_movement_list
        freeze
      end

      def carrier_movement_list
        @carrier_movement_list.dup.freeze
      end

      def ==(other)
        other.is_a?(Schedule) && same_value_as?(other)
      end
      alias_method :eql?, :==

      private

        def carrier_movement_list=(carrier_movement_list)
          raise_null_arg_error unless carrier_movement_list
          raise_empty_list_error unless carrier_movement_list.any?
          @carrier_movement_list = carrier_movement_list
        end

        def raise_null_arg_error
          raise ArgumentError.new('Carrier movements list may not be null')
        end

        def raise_empty_list_error
          raise ArgumentError.new('Carrier movements list may not be empty')
        end

        def same_value_as?(other)
          other && carrier_movement_list == other.carrier_movement_list
        end

    end

  end

end