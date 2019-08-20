class AddPhotoToPillows < ActiveRecord::Migration[5.2]
  def change
    add_column :pillows, :photo, :string
  end
end
