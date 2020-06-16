class CreateInsideCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :inside_carts do |t|
      t.references :client, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
