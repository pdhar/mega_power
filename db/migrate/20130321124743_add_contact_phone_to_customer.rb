class AddContactPhoneToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :contact_phone, :string
  end
end
