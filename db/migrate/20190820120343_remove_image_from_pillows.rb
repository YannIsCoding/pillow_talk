class RemoveImageFromPillows < ActiveRecord::Migration[5.2]
  def change
    remove_column :pillows, :image
  end
end
