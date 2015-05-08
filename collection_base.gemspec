# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'collection_base'
  s.version     = '0.0.1'
  s.summary     = 'Collection base for develop Collection in Cenithub'
  s.description = 'Collection base for develop Collection in Cenithub'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Asnioby Hernandez Lopez'
  s.email     = 'asnioby@gmail.com'
  s.homepage  = 'http://www.cenitsaas.com'

  #s.files       = `git ls-files`.split("\n")
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'json'
  s.add_development_dependency 'cenithub-client'

  s.require_path = 'lib'
  s.requirements << 'none'
end