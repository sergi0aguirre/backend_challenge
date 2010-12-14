require 'machinist/active_record'
require 'faker'
require 'spec/spec_util'
Dir[File.join(File.dirname(__FILE__), 'blueprints', '*_blueprint.rb')].each {|bp| require bp}

