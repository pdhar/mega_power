class CreateBreakdownLabourJoin < ActiveRecord::Migration
  def up
    create_table 'breakdowns_labours', :id => false do |t|
    t.column :breakdown_id, :integer
    t.column :labour_id, :integer
    
  end
  end

  def down
    drop_table 'breakdowns_labours'
  end
end
