class CreatePillows < ActiveRecord::Migration[5.2]
  def change
    create_table :pillows do |t|

      t.timestamps
    end
  end
end
