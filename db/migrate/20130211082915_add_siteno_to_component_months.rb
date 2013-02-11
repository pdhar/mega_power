class AddSitenoToComponentMonths < ActiveRecord::Migration
  def change
    add_column :componentmonths, :siteno, :string
  end
end
