module Model

  module Voyage

    class CarrierMovement

      def initialize(
          departure_location,
          arrival_location,
          departure_time,
          arrival_time
        )
        self.departure_location = departure_location
        self.arrival_location = arrival_location
        self.departure_time = departure_time
        self.arrival_time = arrival_time
        freeze
      end

      attr_reader :departure_location, :arrival_location
      attr_reader :departure_time, :arrival_time

      def ==(other)
        other.is_a?(CarrierMovement) && same_value_as?(other)
      end
      alias_method :eql?, :==

      private

        def departure_location=(departure_location)
          raise_null_arg_error('Departure location') unless departure_location
          @departure_location = departure_location
        end

        def arrival_location=(arrival_location)
          raise_null_arg_error('Arrival location') unless arrival_location
          @arrival_location = arrival_location
        end

        def departure_time=(departure_time)
          raise_null_arg_error('Departure time') unless departure_time
          @departure_time = departure_time
        end

        def arrival_time=(arrival_time)
          raise_null_arg_error('Arrival time') unless arrival_time
          @arrival_time = arrival_time
        end

        def raise_null_arg_error(attribute_name)
          raise ArgumentError.new("#{attribute_name} may not be null")
        end

        def same_value_as?(other)
          other &&
          departure_location == other.departure_location &&
          arrival_location == other.arrival_location &&
          departure_time == other.departure_time &&
          arrival_time == other.arrival_time
        end

    end

    class CarrierMovement

      NONE = new(
        Model::Location::Location::UNKNOWN,
        Model::Location::Location::UNKNOWN,
        DateTime.new(0),
        DateTime.new(0)
      )

    end

  end

end