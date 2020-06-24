class ShippingAddress < ApplicationRecord
  belongs_to :client
  # ここから飯田が足しました（かんちゃんがバリデーションかけてればどっちかでいい）
  with_options presence: true do
    validates :receive_name
    validates :postal_code
    validates :street_address
  end

  def full_address
    [postal_code, street_address, receive_name].join('')
  end
  # ここまで
end
