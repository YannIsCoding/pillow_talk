class ChangeColImageToPhoto < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :image, :photo
  end
end
