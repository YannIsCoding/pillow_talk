class AddPriceColumnToPillows < ActiveRecord::Migration[5.2]
  def change
    add_column :pillows, :price, :integer
  end
end
