Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.include Capybara::DSL
end
