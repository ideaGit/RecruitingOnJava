require 'buildr/jetty'
require 'readline'
require 'cucumber'
require 'cucumber/rake/task'

repositories.remote << 'http://repo1.maven.org/maven2'

VERSION_NUMBER = '1.0'

require "./dependency.rb"

Rake::Task['config:generate'].execute

define 'app' do

  Dir.chdir PROJECT_ROOT do
    rm_rf 'target'
  end

  project.version = VERSION_NUMBER
  compile.options.source = '1.6'
  compile.options.target = '1.6'

  WEB_DEPENDENCY = struct(
    :srping => SPRING,
    :hibernate => HIBERNATE,
    :cglib => CGLIB,
    :database => DATABASE,
    :test => TEST,
    :servlet => SERVLET,
    :log => LOG
  )

  TEST_DEPENDENCY = struct(
    :test => TEST
  )

  compile.with WEB_DEPENDENCY
  package(:war).with :libs => WEB_DEPENDENCY
  test.using :junit
  test.with TEST_DEPENDENCY

  Java.classpath << JETTY_JSP

  task('jetty-run' => [package(:war), jetty.use]) do |task|
    jetty.deploy('http://localhost:8080', task.prerequisites.first)
  end

  task('jetty' => [package(:war), jetty.use]) do |task|
    jetty.deploy('http://localhost:8080', task.prerequisites.first)
    Readline::readline('[Type ENTER to stop Jetty]')
  end

  Cucumber::Rake::Task.new(:acceptance => "jetty-run") do |t|
    t.cucumber_opts = ["--profile acceptance", "acceptance/features"]
  end

end

task :ci => ['checkstyle', 'app:acceptance']
