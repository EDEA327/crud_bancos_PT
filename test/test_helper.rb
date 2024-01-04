ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require 'capybara/rails'
require 'capybara/minitest'
require 'capybara/minitest/spec'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    # Incluir I18n en las pruebas
    include I18n
  end
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  # Excluir Capybara::DSL para evitar conflictos
  self.use_transactional_tests = false
  setup do
    Capybara.current_driver = Capybara.javascript_driver if metadata[:js]
  end

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
end
