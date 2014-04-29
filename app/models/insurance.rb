class Insurance < ActiveRecord::Base
  belongs_to :vehicle
  after_save :update_vehicle_reminders
  default_scope :order => "expiry_date asc"
  def update_vehicle_reminders
    self.vehicle.update_reminders
  end
end