class CreateServicepartsments < ActiveRecord::Migration
  def change
    create_table :servicepartsments do |t|
      t.integer :service_id
      t.integer :part_id
      t.datetime :date_added

      t.timestamps
    end
  end
end
