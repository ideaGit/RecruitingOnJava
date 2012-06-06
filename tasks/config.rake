require 'yaml'

namespace :config do
  task :generate do
    env = ENV['ENV'] || 'local'
    puts "=== you are using #{env} environment ==="
    yaml = YAML.load_file("#{PROJECT_ROOT}/config.yml")
    settings = yaml[env]

    File.open("#{PROJECT_ROOT}/src/main/resources/config.properties", 'w+') do |file|
      settings.each_pair do |key, value|
        file.write("#{key}: #{value}\n")
      end
    end

  end
end