class Componentmonth < ActiveRecord::Base
  attr_accessible :component_id, :date_month, :description, :service_ids,
   :total_service_cost, :total_service_parts, :total_service_labour,
   :total_break_cost, :total_break_parts, :total_break_labour
  validates_presence_of :date_month, :description
  #validates_uniqueness_of :component_id, :scope => [:date_month] 
  belongs_to :component
  has_and_belongs_to_many :services
end
