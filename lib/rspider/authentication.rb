require 'rspider/helper/file'
require 'rspider/helper/http'
require 'rspider/model/user'
CONFIG = 'authentication.yaml'

module Rspider
  module Authentication
    @config = Rspider::Helper::File.load_yaml "../config/#{CONFIG}"
    def self.authenticate(rest_url = '', username = '', password ='' )
      api_call = "#{rest_url}#{@config[:api][__method__.to_sym]}"
      params = {
          username: username,
          password: password
      }
      response = Rspider::Helper::Http.post(api_call,params)
      if response[:IsSuccess]
        user = Rspider::Model::User.new
        user.username = username
        user.auth_token = response[:Token]
        user
      else
        false
      end
    end
  end
end