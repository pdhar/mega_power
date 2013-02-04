class AddSiteInfoToComponentmonths < ActiveRecord::Migration
  def change
    add_column :componentmonths, :site_name, :string
    add_column :componentmonths, :onhire_hrs, :decimal, :default=>0.0, :null => false
    add_column :componentmonths, :offhire_hrs, :decimal, :default=>0.0, :null => false
    add_column :componentmonths, :total_hrs, :decimal, :default=>0.0, :null => false
  end
end
