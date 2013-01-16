class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.decimal :price
      t.decimal :depreciation
      t.string :model_no
      t.string :eng_model_no
      t.string :serial_no
      t.string :eng_serial_no
      t.string :alternator_sr_no

      t.timestamps
    end
  end
end
