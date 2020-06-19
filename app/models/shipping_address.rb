class ShippingAddress < ApplicationRecord
  belongs_to :client
  def full_address
    [postal_code, street_address, receive_name].join('')
  end
end
