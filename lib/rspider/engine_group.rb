require 'rspider/helper/file'
require 'rspider/helper/http'
require 'rspider/model/user'
CONFIG = "#{File.basename(__FILE__, File.extname(__FILE__))}.yaml"

module Rspider
  module EngineGroup
    @config = Rspider::Helper::File.load_yaml "../config/#{CONFIG}"
    def self.get_all_engine_groups(rest_url = '', user = Rspider::Model::User.new)
      api_call = "#{rest_url}#{@config[:api][__method__.to_sym]}"
      params = {}
      response = Rspider::Helper::Http.get(api_call, params, user)
      if response[:IsSuccess]
        response[:EngineGroups]
      end
      false
    end
  end
end
