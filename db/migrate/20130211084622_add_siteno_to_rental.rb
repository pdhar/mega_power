class AddSitenoToRental < ActiveRecord::Migration
  def change
    add_column :rentals, :siteno, :string
  end
end
