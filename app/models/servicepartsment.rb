class Servicepartsment < ActiveRecord::Base
  attr_accessible :date_added, :part_id, :service_id, :part_name
  belongs_to :service
  belongs_to :part
  attr_accessor :part_name
  
  def part_name(part_id)
    part_name = Part.where(:id => part_id).pluck(:part_name).first
  end
end
