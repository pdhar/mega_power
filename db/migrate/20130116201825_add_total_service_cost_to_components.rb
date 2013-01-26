class AddTotalServiceCostToComponents < ActiveRecord::Migration
  def change
    add_column :components, :total_service_cost, :decimal, :default=>0.0, :null => false
  end
end
