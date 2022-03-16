# frozen_string_literal: true

require_relative '../app'

require 'pry'
require 'rspec/rails'

RSpec.configure do |config|
  config.default_formatter = :documentation

  config.before(:each, type: :request) do
    host! 'localhost'
  end
end
