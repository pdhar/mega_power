class CreateComponentmonthServiceJoin < ActiveRecord::Migration
  def up
    create_table 'componentmonths_services', :id => false do |t|
    t.column :componentmonth_id, :integer
    t.column :service_id, :integer
  end
  end

  def down
    drop_table 'componentmonths_services'
  end
end
