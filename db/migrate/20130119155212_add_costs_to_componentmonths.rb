class AddCostsToComponentmonths < ActiveRecord::Migration
  def change
    add_column :componentmonths, :total_service_cost, :decimal, :default=>0.0, :null => false
    add_column :componentmonths, :total_service_parts, :decimal, :default=>0.0, :null => false
    add_column :componentmonths, :total_service_labour, :decimal, :default=>0.0, :null => false
    add_column :componentmonths, :total_break_cost, :decimal, :default=>0.0, :null => false
    add_column :componentmonths, :total_break_parts, :decimal, :default=>0.0, :null => false
    add_column :componentmonths, :total_break_labour, :decimal, :default=>0.0, :null => false
  end
end

