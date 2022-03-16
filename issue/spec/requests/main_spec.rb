# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'main API', type: :request do
  context "GET '/hello/world'" do
    before { get '/hello/world' }

    it 'returns hello world', :aggregate_failures do
      expected_body = { hello: :world }

      expect(response).to be_successful
      expect(response.body).to match expected_body.to_json
    end
  end

  context "GET '/test'" do
    before { get '/test' }

    it { expect(response).to be_successful }
  end

  context "GET '/engine_test'" do
    before { get '/engine_test' }

    it { expect(response).to be_successful }
  end

  context "GET '/aaa'", openapi: false do
    before { get '/aaa' }

    it { expect(response).not_to be_successful }
  end
end
