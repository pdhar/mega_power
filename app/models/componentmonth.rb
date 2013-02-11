class Componentmonth < ActiveRecord::Base
  attr_accessible :component_id, :date_month, :description, :service_ids,
   :total_service_cost, :total_service_parts, :total_service_labour,
   :total_break_cost, :total_break_parts, :total_break_labour,
   :breakdown_ids, :site_name, :onhire_hrs, :offhire_hrs, :total_hrs, :siteno
  validates_presence_of :date_month, :description, :onhire_hrs, :offhire_hrs 
  
  validates :onhire_hrs, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }
  
  validates :offhire_hrs, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }
                      
  #validates_uniqueness_of :component_id, :scope => [:date_month] 
  belongs_to :component
  has_and_belongs_to_many :services
  has_and_belongs_to_many :breakdowns
end
