require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Cabify < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'http://localhost:3000',
        :authorize_url => 'http://localhost:3000/oauth/new',
        :token_url => 'http://localhost:3000/oauth/token'
      }
      option :authorize_options, [:scope, :response_type]
      option :provider_ignores_state, true

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      uid { raw_info['_id'] }

      info do
        {
          'email' => raw_info['email'],
          'name' => raw_info['name'],
          'role' => raw_info['role']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('oauth/users').parsed
      end

    end
  end
end