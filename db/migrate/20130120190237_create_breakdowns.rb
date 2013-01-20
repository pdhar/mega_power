class CreateBreakdowns < ActiveRecord::Migration
  def change
    create_table :breakdowns do |t|
      t.string :breakdown_name
      t.text :breakdown_description
      t.integer :breakdown_no
      t.decimal :breakdown_cost
      t.decimal :total_parts_cost
      t.decimal :total_labour_cost

      t.timestamps
    end
  end
end
