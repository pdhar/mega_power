class Servicepartsment < ActiveRecord::Base
  attr_accessible :date_added, :part_id, :service_id
  belongs_to :service
  belongs_to :part
end
