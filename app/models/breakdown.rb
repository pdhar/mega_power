class Breakdown < ActiveRecord::Base
  attr_accessible :breakdown_cost, :breakdown_description, :breakdown_name,
  :breakdown_no, :total_labour_cost, :total_parts_cost, :part_ids, :labour_ids

  validates_presence_of :breakdown_description, :breakdown_name, :breakdown_no
  validates_uniqueness_of :breakdown_no
  validates_length_of :breakdown_description, :maximum => 50
  
  has_and_belongs_to_many :labours
  has_and_belongs_to_many :parts
  has_and_belongs_to_many :componentmonths
end

