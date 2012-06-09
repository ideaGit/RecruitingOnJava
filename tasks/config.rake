require 'yaml'

namespace :config do

  task :generate do

    File.open("#{PROJECT_ROOT}/src/main/resources/config.properties", 'w+') do |file|
      CONFIG_SETTING.each_pair do |key, value|
        file.write("#{key}: #{value}\n")
      end
    end

  end
end