class CreateLabours < ActiveRecord::Migration
  def change
    create_table :labours do |t|
      t.string :labour_no
      t.string :labour_name
      t.string :labour_description
      t.decimal :labour_cost_per_hr

      t.timestamps
    end
  end
end
