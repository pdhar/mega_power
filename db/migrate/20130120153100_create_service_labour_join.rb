class CreateServiceLabourJoin < ActiveRecord::Migration
  def up
    create_table 'labours_services', :id => false do |t|
    t.column :service_id, :integer
    t.column :labour_id, :integer
    
  end
  end

  def down
    drop_table 'labours_services'
  end
end
