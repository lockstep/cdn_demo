source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# Use postgresql as the database for Active Record
gem 'pg', '0.18.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.7.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.2.6'
gem 'execjs', '2.5.2'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'therubyracer', '0.12.2'
gem 'jquery-rails', '4.0.3'  # Needed for Bootstrap's js plugins
# Auth
gem 'devise', '3.5.1'
# Permissions
gem 'cancancan', '1.10.1'
# Manage ENV vars
gem 'figaro', '1.1.1'
# HAML templating
gem 'haml', '4.0.6'
gem 'html2haml', '1.0.1'
gem 'aws-sdk', '1.64.0'

gem 'paperclip', '4.2.1'
gem 'rails_stdout_logging', '0.0.3'
gem 'libv8', '3.16.14.7'
gem 'ref', '1.0.5'

gem 'zencoder'

group :development do
  gem 'spring', '1.3.6'
  gem "spring-commands-rspec", '1.0.4'
  gem 'binding_of_caller', '0.7.2'
end

group :development, :test do
  gem 'factory_girl_rails', '4.5.0'
  gem 'rspec-rails', '3.3.3'
  gem 'capybara', '2.4.4'
  gem 'capybara-webkit', '1.5.1'
  # You need database_cleaner when using capybara-webkit to use truncation
  # instead of transactional cleaning after tests
  # # http://stackoverflow.com/questions/8178120/capybara-with-js-true-causes-test-to-fail
  gem 'database_cleaner', '1.4.1'
  # Launchy will open pages when using save_and_open_page
  gem 'launchy', '2.4.3'

  gem 'sexp_processor', '4.4.4'
end

group :test do
  # Prevent external API requests
  gem 'webmock', '1.21.0'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'rails_12factor', group: :production
ruby '2.2.2'
