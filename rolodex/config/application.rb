require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module Rolodex
  class Application < Rails::Application

    config.generators do |g|
      g.orm                 :active_record
      g.template_engine     :erb
      g.integration_tool    :rspec
      g.test_framework      :rspec, :views => false, :helpers => false
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    config.encoding = "utf-8"
    config.filter_parameters += [:password]
  end
end
