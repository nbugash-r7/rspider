require 'rspider/helper/file'
require 'rspider/helper/http'
require 'rspider/model/user'
CONFIG = "#{File.basename(__FILE__, File.extname(__FILE__))}.yaml"

module Rspider
  module Engine
    @config = Rspider::Helper::File.load_yaml "../config/#{CONFIG}"
    def self.get_scan_engines(rest_url = '', user = Rspider::Model::User.new)
      unless user.username.to_s.empty? or user.auth_token.to_s.empty?
        api_call = "#{rest_url}#{@config[:api][__method__.to_sym]}"
        params = {} # No params specified in the API
        response = Rspider::Helper::Http.get(api_call, params, user)
        if response[:IsSuccess]
          return response
        end
      end
      false
    end
  end
end
