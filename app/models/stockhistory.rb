class Stockhistory < ActiveRecord::Base
  attr_accessible :change_value, :description, :part_id, :created_at
  
  belongs_to :part
end
