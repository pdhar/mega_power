class AddServiceCostToServices < ActiveRecord::Migration
  def change
    add_column :services, :service_cost, :decimal, :default=>0.0, :null => false
  end
end
