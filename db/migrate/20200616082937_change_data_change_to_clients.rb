class ChangeDataChangeToClients < ActiveRecord::Migration[5.2]
  def change
  	change_column :clients, :deleted_at, :datetime
  end
end
