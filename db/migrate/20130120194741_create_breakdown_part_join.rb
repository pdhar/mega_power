class CreateBreakdownPartJoin < ActiveRecord::Migration
  def up
    create_table 'breakdowns_parts', :id => false do |t|
    t.column :breakdown_id, :integer
    t.column :part_id, :integer
    
  end
  end

  def down
    drop_table 'breakdowns_parts'
  end
end
