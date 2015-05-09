# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'collection_base/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'collection_base'
  s.version     = CollectionBase::VERSION
  s.summary     = 'Collection base for develop Collection in Cenithub'
  s.description = 'Collection base for develop Collection in Cenithub'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Asnioby Hernandez Lopez'
  s.email     = 'asnioby@gmail.com'
  s.homepage  = 'http://www.cenitsaas.com'
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.9"
  s.add_development_dependency "rake", "~> 10.0"

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'json'
  s.add_development_dependency 'cenithub-client'

  s.requirements << 'none'
end
