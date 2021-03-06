# frozen_string_literal: true

require File.expand_path('../lib/poller/json/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Markus Krogemann']
  gem.email         = ['markus@krogemann.de']
  gem.description   = "JSON matchers to be used on top of the 'poller' gem"
  gem.summary       = 'JSON matchers'
  gem.homepage      = 'https://github.com/mkrogemann/poller-json'
  gem.license       = 'MIT'

  gem.files         = Dir['lib/**/*.rb']
  gem.test_files    = []
  gem.name          = 'poller-json'
  gem.require_paths = ['lib']
  gem.version       = Poller::JSON::VERSION
  gem.add_runtime_dependency('json', '~> 1.8.1') if RUBY_VERSION == '1.8.7'
  gem.add_runtime_dependency('multi_json', '~> 1.10.1') if RUBY_VERSION != '1.8.7'
  gem.add_runtime_dependency('poller', '>= 0.5.3')
  gem.add_development_dependency('rspec', '~> 3.1.0')
  gem.add_development_dependency('simplecov', '~> 0.9.1')
end
