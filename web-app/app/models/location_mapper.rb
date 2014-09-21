class LocationMapper

  class << self

    def from_data(data_location)
      if data_location.is_a?(Enumerable)
        data_location.map { |dl| convert_from_data(dl) }
      else
        convert_from_data(data_location)
      end
    end

    def from_domain(domain_location)
      if domain_location.is_a?(Enumerable)
        domain_location.map { |dl| convert_from_domain(dl) }
      else
        convert_from_domain(domain_location)
      end
    end

    private

      def convert_from_data(data_location)
        Model::Location::Location.new(
          Model::Location::UNLocode.new(data_location.un_locode),
          data_location.name
        )
      end

      def convert_from_domain(domain_location)
        Location.new(
          un_locode: domain_location.un_locode.un_locode,
          name: domain_location.name
        )
      end

  end

end