class Labour < ActiveRecord::Base
  attr_accessible :labour_cost_per_hr, :labour_description, :labour_name, :labour_no
  
  validates_presence_of :labour_description, :labour_name, :labour_no
  validates_uniqueness_of :labour_no
  validates :labour_cost_per_hr, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,4}(\.\d{0,2})?$/ }
            
  validates_length_of :labour_description, :maximum => 50
  has_and_belongs_to_many :services
end
