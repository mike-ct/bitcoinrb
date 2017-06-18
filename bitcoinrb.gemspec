# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitcoin/version'

Gem::Specification.new do |spec|
  spec.name          = "bitcoinrb"
  spec.version       = Bitcoin::VERSION
  spec.authors       = ["azuchi"]
  spec.email         = ["azuchi@haw.co.jp"]

  spec.summary       = %q{The implementation of Bitcoin Protocol for Ruby.}
  spec.description   = %q{The implementation of Bitcoin Protocol for Ruby.}
  spec.homepage      = 'https://github.com/haw-itn/bitcoinrb'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'ecdsa'
  spec.add_runtime_dependency 'eventmachine'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end