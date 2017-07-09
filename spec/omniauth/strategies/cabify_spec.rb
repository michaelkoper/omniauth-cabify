require 'spec_helper'

RSpec.describe OmniAuth::Strategies::Cabify do
  let(:parsed_response) { double('ParsedResponse') }
  let(:response) { double('Response', parsed: parsed_response) }
  let(:access_token) { double('AccessToken', options: {}, get: response) }

  subject(:strategy) { OmniAuth::Strategies::Cabify.new(nil) }

  before { allow(strategy).to receive(:access_token) { access_token } }

  describe '#client' do
    it 'returns the root url for the site' do
      expect(strategy.client.site).to eq('https://cabify.com')
    end

    it 'returns a authorize url' do
      expect(strategy.client.options).to include(authorize_url: '/auth/authorizations/new')
    end

    it 'returns a token url' do
      expect(strategy.client.options).to include(token_url: '/auth/api/authorization')
    end
  end

  describe '#raw_info' do
    it 'requests the oauth user path' do
      expect(access_token).to receive(:get).with('api/v2/user') { response }
      strategy.raw_info
    end

    it 'returns the pased response' do
      allow(access_token).to receive(:get).with('api/v2/user') { response }
      expect(strategy.raw_info).to eq(parsed_response)
    end
  end
end
