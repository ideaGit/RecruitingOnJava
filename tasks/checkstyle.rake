repositories.remote << "http://repo1.maven.org/maven2"

CHECKSTYLE = transitive("checkstyle:checkstyle:jar:4.4")
reports_dir = './reports/'

desc "run check style"
task :checkstyle do
  begin
    ant("checkstyle") do |ant|
      rm_rf "#{reports_dir}/checkstyle_report.xml"
      mkdir_p reports_dir

      ant.taskdef :resource=>"checkstyletask.properties", :classpath=>Buildr.artifacts(CHECKSTYLE).each(&:invoke).map(&:name).join(File::PATH_SEPARATOR)
      ant.checkstyle :config=>"tasks/checkstyle_checks.xml", :maxWarnings=>0, :classpath=>Buildr.artifacts([SPRING.mvc]).join(File::PATH_SEPARATOR) do
        ant.formatter :type=>"plain"
        ant.formatter :type=>"xml", :toFile=>"reports/checkstyle_report.xml"

        ant.property :key=>"javadoc.method.scope", :value=>"public"
        ant.property :key=>"javadoc.type.scope", :value=>"package"
        ant.property :key=>"javadoc.var.scope", :value=>"package"
        ant.property :key=>"javadoc.lazy", :value=>"false"
        ant.property :key=>"checkstyle.cache.file", :value=>"target/checkstyle.cache.src"
        ant.property :key=>"checkstyle.header.file", :value=>"buildconf/LICENSE.txt"

        ant.fileset :dir=>"src/main/java", :includes=>"**/*.java", :excludes=>""
      end

      ant.xslt :in=>"#{reports_dir}/checkstyle_report.xml", :out=>"#{reports_dir}/checkstyle_report.html", :style=>"tasks/checkstyle-noframes.xsl"
    end
  end
end