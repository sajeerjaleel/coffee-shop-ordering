#####
# !!!WARNING!!!
# DO NOT CHANGE THIS FILE WITH OUT APPROVAL FROM THE VP OF SOFTWARE ENGINEERING
# This file is ment to be small and simple on purpose.  Should not have rails or mocha, etc...
# Runs the unit tests for CI, use "rake --rakefile Rakefile.norails ci:unit" for faster tests without rails
#####
require 'simplecov'
require 'minitest/autorun'
require 'minitest/reporters'
# MIMIC ENV LOAD_PATHS
load_paths = []

app_root = File.expand_path("../../../", __FILE__)
load_paths += Dir[File.expand_path("#{app_root}/{app/models,app/helpers/api,app/services,lib}")]

load_paths.each do |load_path|
  $LOAD_PATH.unshift(load_path) unless $LOAD_PATH.include?(load_path)
end

# CODE COVERAGE
if ENV['CODE_COVERAGE']
  SimpleCov.start do
    add_filter '/test/'
    add_filter '/spec/'
    add_filter '/config/'
  end
end


