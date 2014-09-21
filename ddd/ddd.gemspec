# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ddd/version'

Gem::Specification.new do |spec|
  spec.name          = "ddd"
  spec.version       = DDD::VERSION
  spec.authors       = ["Bill Eisenhauer"]
  spec.email         = ["bill@billeisenhauer.com"]
  spec.summary       = %q{Domain-Driven Design Tools.}
  spec.description   = %q{DDD tools.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-expectations"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "pry"
end
