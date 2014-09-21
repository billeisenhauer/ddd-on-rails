# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'app_services/version'

Gem::Specification.new do |spec|
  spec.name          = "app_services"
  spec.version       = AppServices::VERSION
  spec.authors       = ["Bill Eisenhauer"]
  spec.email         = ["bill@billeisenhauer.com"]
  spec.summary       = %q{App Services for DDD Example app.}
  spec.description   = %q{The application services for the DDD Example app.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_runtime_dependency 'domain' 

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-expectations"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "pry"
end
