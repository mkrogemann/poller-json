# -*- encoding: utf-8 -*-
require File.expand_path('../lib/poller_json/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Markus Krogemann"]
  gem.email         = ["markus@krogemann.de"]
  gem.description   = %q{JSON matchers to be used with my poller gem}
  gem.summary       = %q{JSON matchers}
  gem.homepage      = "https://github.com/mkrogemann/poller-json"
  gem.license       = 'MIT'

  gem.files         = Dir['lib/**/*.rb']
  gem.test_files    = []
  gem.name          = "poller-json"
  gem.require_paths = ["lib"]
  gem.version       = PollerJSON::VERSION
  gem.add_dependency('poller')
  gem.add_dependency('json')
  gem.add_development_dependency('rspec', '~> 2.13.0')
  gem.add_development_dependency('simplecov', '~> 0.7.1')
end
