require_relative "boot"

require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module CodeSnippets
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    config.load_defaults 5.1
    config.generators.system_tests = nil
    config.action_controller.action_on_unpermitted_parameters = :raise

    config.generators do |generate|
      generate.helper false
      generate.javascript_angine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end
  end
end
