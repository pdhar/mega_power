class CreateRentalitemsComponentsJoin < ActiveRecord::Migration
  def up
    create_table 'components_rentalitems', :id => false do |t|
    t.column :component_id, :integer
    t.column :rentalitem_id, :integer
  end
  end

  def down
    drop_table 'components_rentalitems'
  end
end
