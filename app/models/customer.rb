class Customer < ActiveRecord::Base
  default_scope order('name ASC')
  
  attr_accessible :address, :contact1, :contact2, :contact3, :contact_phone,
   :email, :fax, :name, :telephone, :rentals_attributes, :rentalitems_attributes, :component_ids
  
  validates_presence_of :address, :contact1, :name, :telephone, :email
  
  validates_uniqueness_of :name, :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  
  has_many :rentals, :dependent => :destroy
  accepts_nested_attributes_for :rentals, allow_destroy: true 
end
