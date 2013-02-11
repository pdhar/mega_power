class Component < ActiveRecord::Base
  default_scope order('mpgno ASC')
  
  attr_accessible :alternator_sr_no, :depreciation, :eng_model_no, :eng_serial_no, 
    :model_no, :price, :serial_no, :componentmonths_attributes, :total_service_cost,
    :site_name, :commision_date, :purchase_date, :depreciated_cost, :rating, :mpgno, :siteno
  
  validates_presence_of :mpgno, :eng_model_no, :eng_serial_no, :model_no, :serial_no,
  :commision_date, :purchase_date, :depreciated_cost, :rating
  
  validates_uniqueness_of :mpgno #, :serial_no
  
  validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,6}(\.\d{0,2})?$/ }
  
  validates :depreciation, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,2}(\.\d{0,2})?$/ }  
      
  has_many :componentmonths, :dependent => :destroy, :order => "date_month"
  accepts_nested_attributes_for :componentmonths, allow_destroy: true  
  has_and_belongs_to_many :rentalitems            
end
