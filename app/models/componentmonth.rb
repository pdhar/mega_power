class Componentmonth < ActiveRecord::Base
  
  include ActiveModel::Dirty
  
  #after_create :create_stock_used_event
  #before_save :update_stock_used_event
    
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
  has_and_belongs_to_many :services, :after_add => :update_stock_used, :after_remove => :update_stock_add
  has_and_belongs_to_many :breakdowns
  
private

  def update_stock_add(service)
    #Rails.logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Service Removed #{service.inspect}")
    service.servicepartsments.each do |part|
      Part.update_all(["used_stock = used_stock - ?", part.quantity], :id => part.part_id) 
    end
  end
  
  def update_stock_used(service)
    #Rails.logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Service Added #{service.inspect}")
    service.servicepartsments.each do |part|
      Part.update_all(["used_stock = used_stock + ?", part.quantity], :id => part.part_id) 
    end
  end
    
end
