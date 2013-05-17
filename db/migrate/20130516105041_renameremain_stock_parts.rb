class RenameremainStockParts < ActiveRecord::Migration
  def up
    rename_column :parts, :remain_stock, :used_stock
  end

  def down
  end
end
