require '../test/base'
require 'rspider/model/user'
module Rspider
  module Test
    class Authentication < Rspider::Test::Base
      def setup
        @username = "#{ENV['USERNAME']}"
        @password = "#{ENV['PASSWORD']}"
        super()
      end

      def test_invalid_user_authentication
        begin
          @username = 'invalid_user'
          Rspider::Authentication.authenticate(@rest_url, @username, @password)
        rescue
          assert_raises 'Minitest::UnexpectedError: RestClient::Unauthorized: 401 Unauthorized'
        end
      end

      def test_invalid_password_authentication
        begin
          @password = 'invalid_password'
          Rspider::Authentication.authenticate(@rest_url, @username, @password)
        rescue
          assert_raises 'Minitest::UnexpectedError: RestClient::Unauthorized: 401 Unauthorized'
        end
      end

      def test_valid_authentication
        user = Rspider::Authentication.authenticate(@rest_url, @username, @password)
        assert_equal Rspider::Model::User, user.class
      end
    end
  end
end

