source 'https://rubygems.org'

# Declare your gem's dependencies in collection_north.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem 'rubocop'

gem 'sqlite3'

group :test do
  gem 'rspec-its'
  gem 'ci_reporter_rspec'
  gem 'timecop'
end

group :development, :test do
  gem 'fcrepo_wrapper'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'ruby-debug-passenger'
  gem 'selenium-webdriver'
  gem 'jettywrapper'
  gem 'capybara'
  gem 'poltergeist', '~> 1.5'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara-select2'
  gem 'show_me_the_cookies'
  gem 'brakeman'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'ruby-prof'
  gem 'rest-client'
end
