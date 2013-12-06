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
  gem.add_runtime_dependency('poller', '>= 0.5.0')
  if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
    gem.add_runtime_dependency('rubysl', '~> 2.0')
    gem.add_runtime_dependency('rubysl-json', '~> 2.0.2')
  else
    gem.add_runtime_dependency('multi_json', '~> 1.8.2') if RUBY_VERSION != '1.8.7'
    gem.add_runtime_dependency('json', '~> 1.8.1') if RUBY_VERSION == '1.8.7'
  end
  gem.add_development_dependency('rspec', '~> 2.14.1')
  gem.add_development_dependency('simplecov', '~> 0.8.2')
end
