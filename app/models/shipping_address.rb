class ShippingAddress < ApplicationRecord
  belongs_to :client
  # ここから飯田が足しました
  def full_address
    [postal_code, street_address, receive_name].join('')
  end
  # ここまで
end
