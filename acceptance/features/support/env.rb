begin
  require 'rspec/expectations'
rescue LoadError;
  require 'spec/expectations'
end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/mechanize/cucumber'

PROJECT_ROOT = File.join(File.dirname(__FILE__), "../../../.")
env = ENV['ENV'] || 'local'
puts "=== you are using #{env} environment ==="
yaml = YAML.load_file("#{PROJECT_ROOT}/config.yml")

CONFIG_SETTING = yaml[env]

if env == 'ci'
  Capybara.default_driver = :mechanize
else
  Capybara.default_driver = :selenium
end
Capybara.default_wait_time = 10
Capybara.default_selector= :css
Capybara::Selenium::Driver::DEFAULT_OPTIONS[:resynchronize] = false
Capybara.ignore_hidden_elements = false
Capybara.app_host = 'http://localhost:8080'

World(Capybara)
