# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pwg'

Gem::Specification.new do |spec|
  spec.name          = "pwg"
  spec.version       = ::VERSION.join('.')
  spec.authors       = ["Nandor Biro"]
  spec.email         = ["info@nandito.info"]

  spec.summary       = %q{CLI password generator}
  spec.description   = %q{Generate passwords in command line.}
  spec.homepage      = "https://github.com/nandito/pwg"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb']
  #spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["pwg"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
