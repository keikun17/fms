class PreventiveMaintenance < ActiveRecord::Base
  belongs_to :service_center
  belongs_to :vehicle
  
  after_create :update_vehicle_mileage, :if => :has_mileage_reading?
  after_save :update_vehicle_reminders
  
  def has_mileage_reading?
    !odometer_reading.blank? and !pms_date.nil?
  end
  
  def update_vehicle_mileage
    vehicle.mileages.create(:reading => odometer_reading, :date_logged => pms_date)
  end
  
  
  def update_vehicle_reminders
    self.vehicle.update_reminders
  end
    
end
