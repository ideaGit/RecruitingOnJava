PROJECT_ROOT = File.join(File.dirname(__FILE__), "../.")

env = ENV['ENV'] || 'local'
puts "=== you are using #{env} environment ==="
yaml = YAML.load_file("#{PROJECT_ROOT}/config.yml")

CONFIG_SETTING = yaml[env]