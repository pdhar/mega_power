class AddMpgnoToComponents < ActiveRecord::Migration
  def change
    add_column :components, :mpgno, :string
  end
end
