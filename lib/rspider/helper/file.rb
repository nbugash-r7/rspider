require 'yaml'
require 'active_support'
module Rspider
  module Helper
    module File
      def self.load_yaml(filename = '')
        hash = YAML::load_file filename
        return symbolize_keys(hash)
      end

      private
      # @param [Object] hash
      def self.symbolize_keys(hash)
        hash.inject({}){|result, (key, value)|
          new_key = case key
                      when String then key.to_sym
                      else key
                    end
          new_value = case value
                        when Hash then symbolize_keys(value)
                        else value
                      end
          result[new_key] = new_value
          result
        }
      end
    end
  end
end
