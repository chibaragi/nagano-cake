# frozen_string_literal: true

class CreateProductOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :product_orders do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity, null: false
      t.integer :once_price, null: false
      t.integer :product_order_status, default: 0, null: false
      t.timestamps
    end
  end
end
