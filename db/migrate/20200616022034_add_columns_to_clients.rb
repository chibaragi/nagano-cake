class AddColumnsToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :first_name_kana, :string
    add_column :clients, :last_name_kana, :string
    add_column :clients, :phone_number, :string
    add_column :clients, :postal_code, :string
    add_column :clients, :street_address, :string
    add_column :clients, :deleted_at, :datetime
  end
end
