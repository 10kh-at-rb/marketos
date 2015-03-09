require 'rails_helper'

RSpec.configure do |config|

  # Capybara.javascript_driver = :webkit
  config.use_transactional_fixtures = false
  config.include FeaturesHelpers, type: :feature

  Capybara.configure do |config|
    config.javascript_driver = :webkit
    config.match = :prefer_exact
    config.ignore_hidden_elements = false
    config.visible_text_only = false
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include SphinxHelpers, type: :feature

  config.before(:suite) do
    # Ensure sphinx directories exist for the test environment
    ThinkingSphinx::Test.init
    # Configure and start Sphinx, and automatically
    # stop Sphinx at the end of the test suite.
    ThinkingSphinx::Test.start_with_autostop
  end

  # config.before(:each) do
  #   # Index data when running an acceptance spec.
  #   index if example.metadata[:js]
  # end

end