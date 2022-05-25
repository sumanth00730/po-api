require "test_helper"

class PurchaseordersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchaseorders_index_url
    assert_response :success
  end

  test "should get show" do
    get purchaseorders_show_url
    assert_response :success
  end

  test "should get delete" do
    get purchaseorders_delete_url
    assert_response :success
  end

  test "should get update" do
    get purchaseorders_update_url
    assert_response :success
  end

  test "should get create" do
    get purchaseorders_create_url
    assert_response :success
  end
end
