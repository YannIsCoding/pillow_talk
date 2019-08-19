class AddColumnToPillows < ActiveRecord::Migration[5.2]
  def change
    add_column :pillows, :name, :string
    add_column :pillows, :description, :text
  end
end
