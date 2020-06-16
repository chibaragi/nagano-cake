require 'test_helper'

class Clients::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clients_orders_new_url
    assert_response :success
  end

  test "should get pre_create" do
    get clients_orders_pre_create_url
    assert_response :success
  end

  test "should get confirm_order" do
    get clients_orders_confirm_order_url
    assert_response :success
  end

  test "should get after_order" do
    get clients_orders_after_order_url
    assert_response :success
  end

  test "should get index" do
    get clients_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get clients_orders_show_url
    assert_response :success
  end
end
