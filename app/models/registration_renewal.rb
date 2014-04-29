class RegistrationRenewal < ActiveRecord::Base
  belongs_to :vehicle
  
  default_scope :order => 'renewal_date asc'
  
  validates_presence_of :vehicle
  validates_presence_of :renewal_date
  
  after_save :update_vehicle_reminders
  
  def update_vehicle_reminders
    self.vehicle.update_reminders
  end
  
end
