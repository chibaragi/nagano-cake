class RenameIsEnabledColumnToClients < ActiveRecord::Migration[5.2]
  def change
  	rename_column :clients, :is_enabled, :deleted_at
  end
end
