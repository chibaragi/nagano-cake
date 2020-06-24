# frozen_string_literal: true

require 'test_helper'

class Clients::InsideCartsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get clients_inside_carts_index_url
    assert_response :success
  end
end
