require 'buildr/jetty'
require 'readline'

PROJECT_ROOT = File.join(File.dirname(__FILE__), ".")

repositories.remote << 'http://repo1.maven.org/maven2'

VERSION_NUMBER = '1.0'

require "./dependency.rb"

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

  compile.with WEB_DEPENDENCY
  package(:war).with :libs => WEB_DEPENDENCY
  test.using :junit

  Java.classpath << JETTY_JSP

  task('jetty' => [package(:war), jetty.use]) do |task|
    jetty.deploy('http://localhost:8080', task.prerequisites.first)
    Readline::readline('[Type ENTER to stop Jetty]')
  end

  task('asset') do |task|
    Dir.chdir PROJECT_ROOT do
      rm_rf 'src/main/webapp/img'
      rm_rf 'src/main/webapp/css'
      rm_rf 'src/main/webapp/js'
      cp_r 'assets/bootstrap/img', 'src/main/webapp/img'
      cp_r 'assets/bootstrap/css', 'src/main/webapp/css'
      cp_r 'assets/bootstrap/js', 'src/main/webapp/js'
    end
  end

end
