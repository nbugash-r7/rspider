require '../test/base'

module Rspider
  module Test
    class Engine < Rspider::Test::Base
      def setup
        @engine_id = ''
        super()
      end

      def test_get_scan_engines
        response = Rspider::Engine.get_scan_engines(@rest_url, @user)
        assert_equal true, response
      end

    end
  end
end
