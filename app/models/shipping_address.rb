# frozen_string_literal: true

class ShippingAddress < ApplicationRecord
  belongs_to :client

  with_options presence: true do
    validates :receive_name
    validates :street_address
  end

  validates :postal_code, format: { with: /\A\d{7}\z/ }
  # アカウント作成時の郵便番号はハイフンなしの7桁のみ登録可能とするバリデーション

  def full_address
    [postal_code, street_address, receive_name].join('')
  end
end
