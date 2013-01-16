class Component < ActiveRecord::Base
  attr_accessible :alternator_sr_no, :depreciation, :eng_model_no, :eng_serial_no, :model_no, :price, :serial_no, :componentmonths_attributes
  
  validates_presence_of :alternator_sr_no, :eng_model_no, :eng_serial_no, :model_no, :serial_no
  validates_uniqueness_of :model_no, :serial_no
  
  validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }
  
  validates :depreciation, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,2}(\.\d{0,2})?$/ }  
      
  has_many :componentmonths, :dependent => :destroy    
  accepts_nested_attributes_for :componentmonths, allow_destroy: true  
              
end
