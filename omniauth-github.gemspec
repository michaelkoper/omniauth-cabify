# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-cabify/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Koper"]
  gem.email         = ["michaelkoper@gmail.com"]
  gem.description   = %q{Official OmniAuth strategy for Cabify.}
  gem.summary       = %q{Official OmniAuth strategy for Cabify.}
  gem.homepage      = "https://github.com/michaelkoper/omniauth-cabify"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-cabify"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Cabify::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'webmock'
end
