require "test_helper"

class CategoryListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get category_list_index_url
    assert_response :success
  end

  test "should get create" do
    get category_list_create_url
    assert_response :success
  end

  test "should get update" do
    get category_list_update_url
    assert_response :success
  end

  test "should get show" do
    get category_list_show_url
    assert_response :success
  end

  test "should get new" do
    get category_list_new_url
    assert_response :success
  end

  test "should get edit" do
    get category_list_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get category_list_destroy_url
    assert_response :success
  end
end
