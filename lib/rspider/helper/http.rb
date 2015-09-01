require 'rest-client'
require 'rspider/model/user'

module Rspider
  module Helper
    module Http
      def self.get(api_call = '', params = {}, user = Rspider::Model::User.new)
        unless user.username.to_s.empty? or user.username.to_s.empty?
          response = RestClient::Request.execute(
            method: :get,
            url: api_call,
            headers: {
                authorization: "Basic #{user.auth_token}",
                params: params
            }
          )
          response = JSON.parse(response, symbolize_names: true)
          return response
        end
        false
      end

      def self.post(api_call = '', params = {}, user = Rspider::Model::User.new)
        if user.username.to_s.empty? or user.auth_token.to_s.empty?
          response = RestClient::Request.execute(
            method: :post,
            url: api_call,
            payload: {
                # the key 'name' and 'password' is required
                # since it's the default parameters for the API
                name: params[:username],
                password: params[:password]
            }
          )
        else
          response = RestClient::Request.execute(
              method: :post,
              url: api_call,
              headers: {
                  # Authorization key is require since this is
                  # the default parameters for the API
                  authorization: "Basic #{user.auth_token.to_s}"
              },
              params: params
          )
        end
        response = JSON.parse(response, symbolize_names: true)
        return response
      end
    end
  end
end
