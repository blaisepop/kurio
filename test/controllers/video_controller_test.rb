require 'test_helper'

class VideoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get video_new_url
    assert_response :success
  end

  test "should get create" do
    get video_create_url
    assert_response :success
  end

  test "should get update" do
    get video_update_url
    assert_response :success
  end

  test "should get edit" do
    get video_edit_url
    assert_response :success
  end

  test "should get show" do
    get video_show_url
    assert_response :success
  end

  test "should get index" do
    get video_index_url
    assert_response :success
  end

  test "should get destroy" do
    get video_destroy_url
    assert_response :success
  end

end
