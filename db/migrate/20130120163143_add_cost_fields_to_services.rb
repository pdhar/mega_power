class AddCostFieldsToServices < ActiveRecord::Migration
  def change
    add_column :services, :total_parts_cost, :decimal, :default=>0.0, :null => false
    add_column :services, :total_labour_cost, :decimal, :default=>0.0, :null => false
  end
end
