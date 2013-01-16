class AddServiceCostToServices < ActiveRecord::Migration
  def change
    add_column :services, :service_cost, :decimal
  end
end
