require 'test_helper'

class MyOrderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_order_index_url
    assert_response :success
  end

end
