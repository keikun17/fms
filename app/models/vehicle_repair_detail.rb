class VehicleRepairDetail < ActiveRecord::Base
  belongs_to :vehicle_repair
  belongs_to :repair_type
  
  delegate :name, :to => :repair_type, :prefix => true, :allow_nil => true
end
