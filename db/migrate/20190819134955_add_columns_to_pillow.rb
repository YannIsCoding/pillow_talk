class AddColumnsToPillow < ActiveRecord::Migration[5.2]
  def change
    add_reference :pillows, :user, foreign_key: true
    add_column :pillows, :address, :string
    add_column :pillows, :category, :string
    add_column :pillows, :image, :string
  end
end
