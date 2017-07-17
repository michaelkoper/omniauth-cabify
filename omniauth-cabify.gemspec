# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-cabify/version'

Gem::Specification.new do |gem|
  gem.name          = 'omniauth-cabify'
  gem.version       = OmniAuth::Cabify::VERSION
  gem.authors       = ['Michael Koper']
  gem.email         = ['michaelkoper@gmail.com']

  gem.description   = 'Official OmniAuth strategy for Cabify.'
  gem.summary       = 'Official OmniAuth strategy for Cabify.'
  gem.homepage      = 'https://github.com/michaelkoper/omniauth-cabify'
  gem.license       = 'MIT'

  gem.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_dependency 'omniauth', '~> 1'
  gem.add_dependency 'omniauth-oauth2', '~> 1'

  gem.add_development_dependency 'bundler', '~> 1.15'
  gem.add_development_dependency 'rack-test', '~> 0.7'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'webmock', '~> 3.0'
end
