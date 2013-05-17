class Part < ActiveRecord::Base
  default_scope order('part_name ASC')
  
  include ActiveModel::Dirty
  
  before_save :update_stock_event
  
  attr_accessible :update_stock_event, :part_description, :part_name, :part_no, :part_cost, :current_stock, :used_stock
  
  validates_presence_of :part_description, :part_name, :part_no 
  validates_uniqueness_of :part_no
  validates_length_of :part_description, :maximum => 50
  validates :part_cost, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }
  
  has_many :stockhistories
  
  has_many :servicepartsments
  has_many :services, :through => :servicepartsments
  has_and_belongs_to_many :breakdowns
  
  accepts_nested_attributes_for :stockhistories, :allow_destroy => true     
  
  
private  
  
  def update_stock_event
    
    if self.current_stock_changed?
      @value_changed = self.current_stock - self.current_stock_was
      if @value_changed < 0
        @udpate_terminology = ["Removed",(-1*@value_changed).to_i.to_s, "from"]
      else
        @udpate_terminology = ["Added",@value_changed.to_i.to_s,"to"]
      end
       
      self.stockhistories.build(:change_value => @value_changed, :description => @udpate_terminology[0] + " " + @udpate_terminology[1] + " items " + @udpate_terminology[2] +" inventory")
    end
  end
end
