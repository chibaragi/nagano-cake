# frozen_string_literal: true

class InsideCart < ApplicationRecord
  belongs_to :client
  belongs_to :product
end
