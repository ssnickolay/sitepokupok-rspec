require 'capybara/rspec'
require 'pry'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.default_wait_time = 15

RSpec.configure do |config|
  Capybara.default_driver = :selenium
end
