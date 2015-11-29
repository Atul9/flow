require File.join(File.dirname(__FILE__), 'common.rb')

#$:.unshift("/Library/RubyMotion/lib")
$:.unshift("/Users/lrz/src/RubyMotion/lib")
require 'motion/project/template/android'

Motion::Project::App.setup do |app|
  app.api_version = '16' unless Motion::Project::Config.starter?
  app.build_dir = 'build/android'

  FLOW_COMPONENTS.each do |comp|
    libdir = File.join(File.dirname(__FILE__), '../flow/' + comp)
    app.files.concat(Dir.glob(File.join(libdir, '*.rb')))
    app.files.concat(Dir.glob(File.join(libdir, 'shared/**/*.rb')))
    app.files.concat(Dir.glob(File.join(libdir, 'android/*.rb')))
    app.files.delete_if { |path| path.include?('ios') }
  end
  app.spec_files.delete_if { |path| path.start_with?('./spec/helpers/ios') }
end
