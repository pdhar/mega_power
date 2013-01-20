class Part < ActiveRecord::Base
  attr_accessible :part_description, :part_name, :part_no, :part_cost
  
  validates_presence_of :part_description, :part_name, :part_no 
  validates_uniqueness_of :part_no
  validates_length_of :part_description, :maximum => 50
  validates :part_cost, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }
  
  has_many :servicepartsments
  has_many :services, :through => :servicepartsments
  has_and_belongs_to_many :breakdowns
end
