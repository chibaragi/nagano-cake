class ChangeColumnsToClients < ActiveRecord::Migration[5.2]
  def change
  	change_column :clients, :first_name, :string, null: false
    change_column :clients, :last_name, :string, null: false
    change_column :clients, :first_name_kana, :string, null: false
    change_column :clients, :last_name_kana, :string, null: false
    change_column :clients, :phone_number, :string, null: false
    change_column :clients, :postal_code, :string, null: false
    change_column :clients, :street_address, :string, null: false
    change_column :clients, :deleted_at, :datetime
  end
end
