$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'collection_north/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'collection_north'
  s.version     = CollectionNorth::VERSION
  s.authors     = ['criedlberger']
  s.email       = ['riedlber@ualberta.ca']
  s.homepage    = 'https://github.com/ualbertalib/CollectionNorth'
  s.summary     = 'Summary of CollectionNorth.'
  s.description = 'Description of CollectionNorth.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 4.2.0'
end
