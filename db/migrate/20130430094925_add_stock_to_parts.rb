class AddStockToParts < ActiveRecord::Migration
  def change
    add_column :parts, :current_stock, :decimal, :default=>0.0, :null => false
    add_column :parts, :remain_stock, :decimal, :default=>0.0, :null => false
  end
end
