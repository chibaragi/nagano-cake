# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true
end
