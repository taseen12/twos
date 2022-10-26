require 'test_helper'

class VideoTourControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get video_tour_index_url
    assert_response :success
  end

end
