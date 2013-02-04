class CreateRentalitems < ActiveRecord::Migration
  def change
    create_table :rentalitems do |t|
      t.date :start
      t.date :end
      t.decimal :price
      t.integer :rental_id

      t.timestamps
    end
  end
end
