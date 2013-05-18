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
  has_and_belongs_to_many :services, :before_add => :update_stock_used, :before_remove => :update_stock_add
  has_and_belongs_to_many :breakdowns
  
  #after_initialize :init
  before_save :update_stock_event 
  before_destroy :update_stock_event
  
  attr_accessor :component_value, :component_errors
  
  
private
  
  def update_stock_event
    unless component_value.nil?
      component_value.description += self.component.mpgno
      component_value.save
    end
    
  end
  
  def update_stock_add(service)
    
    service.servicepartsments.each do |part|
      #Part.update_all(["used_stock = used_stock - ?", part.quantity], :id => part.part_id) 
      @part_to_update = Part.find(part.part_id)
      if @part_to_update.update_attributes(:used_stock => @part_to_update.used_stock - part.quantity, :current_stock => @part_to_update.current_stock + part.quantity )
        unless self.component.nil?
          self.component_value = Stockhistory.create(:part_id => part.part_id, :change_value => (-1*part.quantity), :description => "Returned " + part.quantity.to_i.to_s + " items to inventory for equipment " + self.component.mpgno)    
        else
          self.component_value = Stockhistory.create(:part_id => part.part_id, :change_value => (-1*part.quantity), :description => "Returned " + part.quantity.to_i.to_s + " items to inventory for equipment ")        
        end
      else
        Rails.logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Error removing")
        #self.errors.add(@part_to_update.errors.full_messages.to_sentence)
        raise @part_to_update.errors.full_messages.to_sentence
        return false
      end
       
    end
  end
  
  def update_stock_used(service)
    #Rails.logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Service Added cval #{self.component.inspect}")
    service.servicepartsments.each do |part|
      #Part.update_all(["used_stock = used_stock + ?", part.quantity], :id => part.part_id) 
      @part_to_update = Part.find(part.part_id)
      if @part_to_update.update_attributes(:used_stock => @part_to_update.used_stock + part.quantity, :current_stock => @part_to_update.current_stock - part.quantity )
        unless self.component.nil?
          self.component_value = Stockhistory.create(:part_id => part.part_id, :change_value => part.quantity, :description => "Used " + part.quantity.to_i.to_s + " items from inventory for equipment " + self.component.mpgno)    
        else
          self.component_value = Stockhistory.create(:part_id => part.part_id, :change_value => part.quantity, :description => "Used " + part.quantity.to_i.to_s + " items from inventory for equipment ")# + self.component.mpgno)        
        end
      else
        Rails.logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Error adding " + @part_to_update.errors.full_messages.to_sentence) 
        #self.errors.add(@part_to_update.errors.full_messages.)
        raise @part_to_update.errors.full_messages.to_sentence   
        return false
      end
      
      
    end
  end
    
end
