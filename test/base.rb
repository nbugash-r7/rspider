require 'rspider'
require 'minitest/autorun'

module Rspider
  module Test
    class Base < Minitest::Unit::TestCase
      def setup
        @rest_url = "#{ENV['REST_URL']}"
        @user = Rspider::Authentication.authenticate(
            "#{ENV['REST_URL']}",
            "#{ENV['USERNAME']}",
            "#{ENV['PASSWORD']}"
        )
      end
    end
  end
end
