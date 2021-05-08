class RenamePictureidColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :pictureid, :picture_id
  end
end
