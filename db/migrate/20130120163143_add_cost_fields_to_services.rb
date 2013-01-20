class AddCostFieldsToServices < ActiveRecord::Migration
  def change
    add_column :services, :total_parts_cost, :decimal
    add_column :services, :total_labour_cost, :decimal
  end
end
