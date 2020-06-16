require 'test_helper'

class Clients::ShippingAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clients_shipping_addresses_new_url
    assert_response :success
  end

  test "should get edit" do
    get clients_shipping_addresses_edit_url
    assert_response :success
  end
end
