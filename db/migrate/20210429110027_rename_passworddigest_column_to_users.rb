class RenamePassworddigestColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :passworddigest, :password_digest
  end
end
