require 'spec_helper'
require 'always_true_specification'
require 'always_false_specification'

describe OrSpecification do

  let(:true_spec) { AlwaysTrueSpecification.new }
  let(:false_spec) { AlwaysFalseSpecification.new }

  it 'returns true if both specs are satisfied' do
    and_spec = OrSpecification.new(true_spec, true_spec)
    expect( and_spec.satisfied_by?(Object.new) ).to be true
  end

  it 'returns true if first spec is false and second spec is true' do
    and_spec = OrSpecification.new(false_spec, true_spec)
    expect( and_spec.satisfied_by?(Object.new) ).to be true
  end

  it 'returns true if first spec is true and second spec is false' do
    and_spec = OrSpecification.new(true_spec, false_spec)
    expect( and_spec.satisfied_by?(Object.new) ).to be true
  end

  it 'returns false if both specs fail to be satisified' do
    and_spec = OrSpecification.new(false_spec, false_spec)
    expect( and_spec.satisfied_by?(Object.new) ).to be false
  end

end