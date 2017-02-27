$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'collection_north/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'collection_north'
  s.version     = CollectionNorth::VERSION
  s.authors     = ['Matt Barnett', 'Shane Murnaghan']
  s.email       = ['mbarnett@ualberta.ca', 'murnagha@ualberta.ca']
  s.homepage    = 'https://github.com/ualbertalib/CollectionNorth'
  s.summary     = 'A HydraNorth Collection solution for Hydra'
  s.description = 'A HydraNorth Collection solution for Hydra. Provides support for Collections and Communities'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib, spec/factories}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.require_path = 'lib'
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '>= 4.2.0'
  # curation concerns is broken with jquery-ui-rails >= 6 (jquery-ui/sortable moved),
  # but they don't have their dependencies right
  s.add_dependency 'jquery-ui-rails', '~> 5.0.5'
  s.add_dependency 'curation_concerns', '~> 1.6.1'

  # test dependencies
  s.add_development_dependency 'shoulda-matchers', '~> 2.5'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  s.add_development_dependency 'rubocop', '~> 0.47'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'factory_girl_rails'
  # dummy app dependencies
  s.add_development_dependency 'sqlite3'
end
