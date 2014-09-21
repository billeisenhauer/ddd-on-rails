class OrSpecification < Specification

  def initialize(spec_1, spec_2)
    self.spec_1 = spec_1
    self.spec_2 = spec_2
    super()
  end

  def satisfied_by?(specification)
    spec_1.satisfied_by?(specification) || spec_2.satisfied_by?(specification)
  end

  private

    attr_accessor :spec_1, :spec_2

end
