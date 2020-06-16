class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.references :client, foreign_key: true
      t.string :receive_name, null: false
      t.string :postal_code, null: false
      t.string :street_address, null: false

      t.timestamps
    end
  end
end
