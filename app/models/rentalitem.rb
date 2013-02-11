class Rentalitem < ActiveRecord::Base
  attr_accessible :end, :price, :rental_id, :start, :component_ids
  validates_presence_of  :start 
  
  validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }
            
  belongs_to :rental
  has_and_belongs_to_many :components
  accepts_nested_attributes_for :components, allow_destroy: true 
  
end
