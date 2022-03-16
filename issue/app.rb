# frozen_string_literal: true

begin
  require 'bundler/inline'
rescue LoadError => e
  warn 'Bundler version 1.10 or later is required. Please update your Bundler'
  raise e
end

gemfile(true) do
  source 'https://rubygems.org'

  gem 'rails', '~> 6.0.0'

  gem 'pry-rails'
  gem 'rspec-openapi', path: '../'
  gem 'rspec-rails'
end

require 'action_controller/railtie'
require_relative 'vendor/my_engine/lib/my_engine'

# A test app
class App < Rails::Application
  routes.append do
    mount ::MyEngine::Engine => '/'

    get '/hello/world' => 'hello#world'
    get '/test' => ->(_env) { [200, { 'Content-Type' => 'text/plain' }, ['A TEST']] }
  end

  config.consider_all_requests_local = true # display errors
  config.eager_load = false

  def load_server; end
end

# A test controller
class HelloController < ActionController::API
  def world
    render json: { hello: :world }
  end
end

App.initialize!

## to run directly with ruby app.rb
# Rack::Server.new(app: App, Port: 3000).start
