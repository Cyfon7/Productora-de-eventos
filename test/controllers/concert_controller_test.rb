require "test_helper"

class ConcertControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get concert_new_url
    assert_response :success
  end

  test "should get create" do
    get concert_create_url
    assert_response :success
  end

  test "should get show" do
    get concert_show_url
    assert_response :success
  end

  test "should get update" do
    get concert_update_url
    assert_response :success
  end

  test "should get destroy" do
    get concert_destroy_url
    assert_response :success
  end
end
