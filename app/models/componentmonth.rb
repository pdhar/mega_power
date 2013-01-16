class Componentmonth < ActiveRecord::Base
  attr_accessible :component_id, :date_month, :description
  validates_presence_of :date_month, :description
  belongs_to :component
end
