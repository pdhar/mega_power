class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :part_name
      t.string :part_no
      t.text :part_description
      t.decimal :part_cost
      t.timestamps
    end
  end
end
