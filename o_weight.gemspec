# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'o_weight/version'

Gem::Specification.new do |spec|
  spec.name          = "o_weight"
  spec.version       = OWeight::VERSION
  spec.authors       = ["Maurizio De Magnis"]
  spec.email         = ["maurizio.demagnis@gmail.com"]
  spec.summary       = %q{Olistik version of a weight related PORO.}
  spec.description   = %q{That's what the summary said.}
  spec.homepage      = "http://olistik.github.io/o_weight"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 0"
end
