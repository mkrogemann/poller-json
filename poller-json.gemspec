# -*- encoding: utf-8 -*-
require File.expand_path('../lib/poller/json/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Markus Krogemann"]
  gem.email         = ["markus@krogemann.de"]
  gem.description   = %q{JSON matchers that can be used on top of the 'poller' gem}
  gem.summary       = %q{JSON matchers}
  gem.homepage      = "https://github.com/mkrogemann/poller-json"
  gem.license       = 'MIT'

  gem.files         = Dir['lib/**/*.rb']
  gem.test_files    = []
  gem.name          = "poller-json"
  gem.require_paths = ["lib"]
  gem.version       = Poller::JSON::VERSION
  gem.add_runtime_dependency('poller')
  gem.add_runtime_dependency('multi_json', '~> 1.7.2')
  gem.add_runtime_dependency('json', '~> 1.7.7') if RUBY_VERSION == '1.8.7'
  gem.add_development_dependency('rspec', '~> 2.13.0')
  gem.add_development_dependency('simplecov', '~> 0.7.1')
end
