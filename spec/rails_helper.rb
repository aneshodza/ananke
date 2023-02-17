# frozen_string_literal: true

require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

require 'capybara/rspec'
require 'capybara/rails'
require 'selenium/webdriver'
require 'super_diff/rspec-rails'

require 'factory_bot_rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :system
  config.include Devise::Test::IntegrationHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :model

  config.include FactoryBot::Syntax::Methods

  config.fixture_path = "#{Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.before do |example|
    ActionMailer::Base.deliveries.clear
    I18n.locale = I18n.default_locale
    Rails.logger.debug { "--- #{example.location} ---" }
  end

  config.after do |example|
    Rails.logger.debug { "--- #{example.location} FINISHED ---" }
  end

  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by ENV['SELENIUM_DRIVER']&.to_sym || :selenium_chrome_headless
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

def test_image_url
  "https://#{ENV.fetch('AWS_S3_BUCKET', nil)}.s3.#{ENV.fetch('AWS_REGION', nil)}" \
    ".amazonaws.com/74aa4460b085465763dbff0269814b0d9d819ff7cf727b08b6487749411cfc90"
end
