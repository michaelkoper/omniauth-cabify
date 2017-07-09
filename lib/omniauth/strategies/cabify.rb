require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Cabify < OmniAuth::Strategies::OAuth2
      option :client_options,
             site: 'https://cabify.com',
             authorize_url: '/auth/authorizations/new',
             token_url: '/auth/api/authorization'

      option :authorize_options, %i[scope response_type]
      option :provider_ignores_state, true

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            params[v.to_sym] = request.params[v] if request.params[v]
          end
        end
      end

      uid { raw_info['_id'] }

      info do
        {
          'email' => raw_info['email'],
          'name' => raw_info['name'],
          'surname' => raw_info['surname'],
          'avatar_url' => raw_info['avatar_url'],
          'mobile_cc' => raw_info['mobile_cc'],
          'mobile_num' => raw_info['mobile_num'],
          'locale' => raw_info['locale']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('oauth/users').parsed
      end
    end
  end
end
