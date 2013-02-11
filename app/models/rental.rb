class Rental < ActiveRecord::Base
  attr_accessible :address, :description, :name, :siteno, :total_rental_price, :rentalitems_attributes
  
  belongs_to :customer
  has_many :rentalitems, :dependent => :destroy    
  accepts_nested_attributes_for :rentalitems, allow_destroy: true 
end
