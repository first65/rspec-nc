# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name = 'rspec-nc'
  gem.version = '0.4.0'
  gem.authors = ['Odin Dutton', 'Ben Hamment', 'Matthew Bennett-Lovesey']
  gem.email = ['matthew@innstyle.com'] # WAS: ['odindutton@gmail.com']
  gem.description = 'https://github.com/first65/rspec-nc'
  gem.summary = "RSpec formatter popup desktop notifications"
  gem.homepage = 'https://github.com/first65/rspec-nc'
  gem.license = 'MIT'

  gem.add_dependency 'notifier', '>= 1.2'
  gem.add_dependency 'terminal-notifier', '>= 1.4'
  gem.add_dependency 'rspec', '>= 3'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry'

  gem.files = `git ls-files`.split($\)
  gem.test_files = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ['lib']
end
