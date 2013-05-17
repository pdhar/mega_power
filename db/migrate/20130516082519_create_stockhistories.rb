class CreateStockhistories < ActiveRecord::Migration
  def change
    create_table :stockhistories do |t|
      t.integer :part_id
      t.integer :change_value
      t.text :description

      t.timestamps
    end
  end
end
