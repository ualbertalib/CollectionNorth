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
  s.summary     = 'A Collection solution for Hydra that meets HydraNorth specifications.'
  s.description = 'A Collection solution for Hydra that meets HydraNorth specifications. Provides support for Collections and Communities'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 5.0.1'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'pry'
end
