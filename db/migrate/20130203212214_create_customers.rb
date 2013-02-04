class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :contact1
      t.string :contact2
      t.string :contact3
      t.string :telephone
      t.string :fax
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
