class CreateComponentmonthsBreakdownJoin < ActiveRecord::Migration
  def up
    create_table 'breakdowns_componentmonths', :id => false do |t|
    t.column :componentmonth_id, :integer
    t.column :breakdown_id, :integer
  end
  end

  def down
    drop_table 'breakdowns_componentmonths'
  end
end
