class AddTotalServiceCostToComponents < ActiveRecord::Migration
  def change
    add_column :components, :total_service_cost, :decimal
  end
end
