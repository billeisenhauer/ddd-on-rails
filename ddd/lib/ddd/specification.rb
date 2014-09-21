class Specification

  def initialize
    freeze
  end

  def and(specification)
    AndSpecification.new(self, specification)
  end

end