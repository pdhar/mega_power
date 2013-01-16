class CreateComponentmonths < ActiveRecord::Migration
  def change
    create_table :componentmonths do |t|
      t.integer :component_id
      t.date :date_month
      t.string :description

      t.timestamps
    end
  end
end
