class Service < ActiveRecord::Base
  attr_accessible :service_description, :service_name, :service_no, 
  :part_ids, :service_cost, :labour_ids, :total_parts_cost, :total_labour_cost
  
  validates_presence_of :service_description, :service_name, :service_no 
  validates_uniqueness_of :service_no
  validates_length_of :service_description, :maximum => 50
  validates :service_cost, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }
            
  has_many :servicepartsments
  has_many :parts, :through => :servicepartsments
  has_and_belongs_to_many :componentmonths
  has_and_belongs_to_many :labours
end
