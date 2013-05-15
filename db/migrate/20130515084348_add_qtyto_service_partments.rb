class AddQtytoServicePartments < ActiveRecord::Migration
  def change
    add_column :servicepartsments, :quantity, :integer, :default=>0, :null => false
  end
end
