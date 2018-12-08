class RenameImageDatColumnToPictureDataColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :pictures, :image_data, :picture_data
  end
end
