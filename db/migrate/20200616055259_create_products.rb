# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :genre, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.text :explanation, null: false
      t.string :image_id, null: false
      t.boolean :is_enabled, default: true, null: false

      t.timestamps
    end
  end
end
