class AddCostsToComponentmonths < ActiveRecord::Migration
  def change
    add_column :componentmonths, :total_service_cost, :decimal
    add_column :componentmonths, :total_service_parts, :decimal
    add_column :componentmonths, :total_service_labour, :decimal
    add_column :componentmonths, :total_break_cost, :decimal
    add_column :componentmonths, :total_break_parts, :decimal
    add_column :componentmonths, :total_break_labour, :decimal
  end
end

