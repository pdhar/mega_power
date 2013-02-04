class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :customer_id
      t.string :name
      t.text :description
      t.decimal :total_rental_price
      t.text :address

      t.timestamps
    end
  end
end
