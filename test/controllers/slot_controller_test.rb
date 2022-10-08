require "test_helper"

class SlotControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slot_index_url
    assert_response :success
  end

  test "should get show" do
    get slot_show_url
    assert_response :success
  end

  test "should get edit" do
    get slot_edit_url
    assert_response :success
  end

  test "should get create" do
    get slot_create_url
    assert_response :success
  end

  test "should get update" do
    get slot_update_url
    assert_response :success
  end
end
