class RenameImagesTableToPicturesTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :images, :pictures
  end
end
