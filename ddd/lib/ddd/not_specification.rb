class NotSpecification < Specification

  def initialize(spec_1)
    self.spec_1 = spec_1
    super()
  end

  def satisfied_by?(specification)
    !spec_1.satisfied_by?(specification)
  end

  private

    attr_accessor :spec_1

end