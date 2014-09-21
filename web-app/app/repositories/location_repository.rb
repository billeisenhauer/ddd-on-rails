class LocationRepository

  class << self

    def find(un_locode)
      data_location = Location.find(un_locode)
      LocationMapper.from_data(data_location)
    rescue ActiveRecord::RecordNotFound
      raise ItemNotFound.new
    end

    def find_all
      LocationMapper.from_data(Location.all.to_a)
    end

  end

end