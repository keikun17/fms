class Mileage < ActiveRecord::Base
  belongs_to :vehicle
  
  after_save :update_vehicle_reminders
  
  def update_vehicle_reminders
    self.vehicle.update_reminders
  end
end
