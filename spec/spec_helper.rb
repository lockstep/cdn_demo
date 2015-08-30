ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'webmock/rspec'
# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
WebMock.disable_net_connect!(allow_localhost: true)

Capybara.register_driver :poltergeist do |app|
  options = { js_errors: true, phantomjs_options: ['--load-images=no'],
    inspector: true, debug: false
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Rails.application.routes.url_helpers
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.mock_with :rspec

  # We are using DatabaseCleaner (see below)
  config.use_transactional_fixtures = false

  config.order = :random
  config.infer_spec_type_from_file_location!
  Kernel.srand config.seed
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.fail_fast = true

  config.filter_run :focus
  config.raise_errors_for_deprecations!
  config.run_all_when_everything_filtered = true

  #Configure database cleaner
  config.before(:suite) do |ex|
    DatabaseCleaner.clean_with :truncation
  end

  config.before do |ex|
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do |ex|
    DatabaseCleaner.strategy = :truncation
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
