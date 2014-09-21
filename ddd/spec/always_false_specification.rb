class AlwaysFalseSpecification < Specification

  def satisfied_by?(specification)
    false
  end

end