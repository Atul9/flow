require File.join(File.dirname(__FILE__), 'common.rb')

$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

Motion::Project::App.setup do |app|
  app.build_dir = 'build/ios'
  app.deployment_target = '7.0' unless Motion::Project::Config.starter?

  FLOW_COMPONENTS.each do |comp|
    libdir = File.join(File.dirname(__FILE__), '../flow/' + comp)
    app.files.concat(Dir.glob(File.join(libdir, '*.rb')))
    app.files.concat(Dir.glob(File.join(libdir, 'ios/*.rb')))
  end
  app.files.delete_if { |path| path.start_with?('./app/android') }
end
