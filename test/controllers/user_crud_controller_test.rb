require "test_helper"

class UserCrudControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_crud_index_url
    assert_response :success
  end

  test "should get create" do
    get user_crud_create_url
    assert_response :success
  end

  test "should get update" do
    get user_crud_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_crud_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get user_crud_edit_url
    assert_response :success
  end

  test "should get show" do
    get user_crud_show_url
    assert_response :success
  end
end
