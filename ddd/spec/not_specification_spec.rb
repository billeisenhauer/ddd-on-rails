require 'spec_helper'
require 'always_true_specification'
require 'always_false_specification'

describe NotSpecification do

  let(:true_spec) { AlwaysTrueSpecification.new }
  let(:false_spec) { AlwaysFalseSpecification.new }

  it 'returns false if passed a true spec' do
    not_spec = NotSpecification.new(true_spec)
    expect( not_spec.satisfied_by?(Object.new) ).to be false
  end
  
  it 'returns true if passed a false spec' do
    not_spec = NotSpecification.new(false_spec)
    expect( not_spec.satisfied_by?(Object.new) ).to be true
  end

end