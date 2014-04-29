class Reminder < ActiveRecord::Base
  PMS_DAY_INTERVALS = [7, 14, 30]
  PMS_MILEAGE_INTERVAL = 5000
  UPCOMING_REMINDERS_THRESHOLD = {:days => 10}
  #TODO : CLEAN
  REMINDER_TYPES = {:pms => 1, :vehicle_registration => 2, :vehicle_insurance => 3}
  REMINDER_NAMES = {"1" => "Preventive Maintenance",
    "2" => "Vehicle Registration",
    "3" => "Vehicle Insurance"}
  
  named_scope :pms, where(:reminder_type_id => 1)
  named_scope :vehicle_registrations, where(:reminder_type_id => 2)
  named_scope :vehicle_insurances, where(:reminder_type_id => 3)    
  named_scope :expired,   :conditions => ["reminder_date < ?", Time.now]
  named_scope :upcoming,  :conditions => ["reminder_date >= ? and reminder_date <= ?", Time.now, Time.now.advance(UPCOMING_REMINDERS_THRESHOLD)]
  
  
  belongs_to :parent, :polymorphic => true
  
  def expired?
    reminder_date < Time.now
  end
  
  def reminder_name
    REMINDER_NAMES[reminder_type_id.to_s]
  end
  
end
