# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cruft/version'

Gem::Specification.new do |spec|
  spec.name          = "cruft"
  spec.version       = Cruft::VERSION
  spec.authors       = ["Pat Brisbin"]
  spec.email         = ["pbrisbin@gmail.com"]
  spec.description   = %q{Find unused gems}
  spec.summary       = %q{Find unused gems}
  spec.homepage      = "https://github.com/pbrisbin/cruft"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'bundler'
end
