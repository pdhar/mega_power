class AddCommFieldsToComponents < ActiveRecord::Migration
  def change
    add_column :components, :commision_date, :date
    add_column :components, :purchase_date, :date
    add_column :components, :depreciated_cost, :decimal, :default=>0.0, :null => false
    add_column :components, :rating, :string
  end
end
