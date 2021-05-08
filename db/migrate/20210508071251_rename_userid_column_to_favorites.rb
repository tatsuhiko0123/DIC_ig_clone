class RenameUseridColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :userid, :user_id
  end
end
