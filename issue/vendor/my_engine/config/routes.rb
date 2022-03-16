# frozen_string_literal: true

MyEngine::Engine.routes.draw do
  get '/engine_test' => ->(_env) { [200, { 'Content-Type' => 'text/plain' }, ['AN ENGINE TEST']] }
end
