# frozen_string_literal: true

class ShippingAddress < ApplicationRecord
  belongs_to :client

  with_options presence: true do
    validates :receive_name
    validates :postal_code, format: { with: /\A\d{7}\z/ }
    validates :street_address
  end

  def full_address
    [postal_code, street_address, receive_name].join('')
  end
end
